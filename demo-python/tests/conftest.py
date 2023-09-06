import os
import pytest
from selenium import webdriver
from selenium.webdriver.chrome.options import Options as ChromeOptions


def pytest_addoption(parser):
    parser.addoption("--selenium", action="store")


@pytest.fixture(scope="session")
def selenium(request):
    return request.config.option.selenium or "sauce"


def local_driver():
    return webdriver.Chrome()


def sauce_driver(request):
    options = ChromeOptions()

    sauce_options = {'username': os.environ["SAUCE_USERNAME"],
                     'accessKey': os.environ["SAUCE_ACCESS_KEY"],
                     'name': request.node.name}

    options.set_capability('sauce:options', sauce_options)
    sauce_url = "https://ondemand.us-west-1.saucelabs.com/wd/hub"

    return webdriver.Remote(command_executor=sauce_url, options=options)


@pytest.fixture(scope='function')
def driver(request, selenium):
    driver = local_driver() if selenium == 'local' else sauce_driver(request)

    yield driver

    if driver is not None:
        result = "failed" if request.session.testsfailed == 1 else "passed"
        if selenium == 'local':
            print("Test " + result)
        else:
            driver.execute_script("sauce:job-result={}".format(result))

        driver.quit()
