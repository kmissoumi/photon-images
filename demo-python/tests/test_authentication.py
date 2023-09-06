import time

from selenium.webdriver.common.by import By


def test_signin_unsuccessful(driver):
    driver.get("https://www.saucedemo.com/")

    driver.find_element(by=By.ID, value="user-name").send_keys("locked_out_user")
    driver.find_element(by=By.ID, value="password").send_keys("secret_sauce")
    driver.find_element(by=By.ID, value="login-button").click()

    error = driver.find_element(by=By.CSS_SELECTOR, value="[data-test=error]")
    assert "Sorry, this user has been locked out" in error.text


def test_signin_successful(driver):
    driver.get("https://www.saucedemo.com/")
    driver.find_element(by=By.ID, value="user-name").send_keys("standard_user")
    driver.find_element(by=By.ID, value="password").send_keys("secret_sauce")
    driver.find_element(by=By.ID, value="login-button").click()

    assert "https://www.saucedemo.com/inventory.html" == driver.current_url


def test_logout(driver):
    driver.get("https://www.saucedemo.com/")
    driver.find_element(by=By.ID, value="user-name").send_keys("standard_user")
    driver.find_element(by=By.ID, value="password").send_keys("secret_sauce")
    driver.find_element(by=By.ID, value="login-button").click()

    driver.find_element(by=By.ID, value="react-burger-menu-btn").click()
    time.sleep(1)
    driver.find_element(by=By.ID, value="logout_sidebar_link").click()

    assert "https://www.saucedemo.com/" == driver.current_url


