import time

from selenium.webdriver.common.by import By


def login(driver):
    driver.get("https://www.saucedemo.com/")

    driver.find_element(by=By.ID, value="user-name").send_keys("standard_user")
    driver.find_element(by=By.ID, value="password").send_keys("secret_sauce")
    driver.find_element(by=By.ID, value="login-button").click()


def checkout(driver):
    driver.find_element(by=By.ID, value="add-to-cart-sauce-labs-onesie").click()
    driver.find_element(by=By.CSS_SELECTOR, value=".shopping_cart_link").click()
    driver.find_element(by=By.ID, value="checkout").click()


def test_bad_info(driver):
    login(driver)
    checkout(driver)

    driver.find_element(by=By.ID, value="continue").click()

    first_name = driver.find_element(by=By.ID, value="first-name")

    assert "error" in first_name.get_attribute("class")


def test_good_info(driver):
    login(driver)
    checkout(driver)

    driver.find_element(by=By.ID, value="first-name").send_keys("Luke")
    driver.find_element(by=By.ID, value="last-name").send_keys("Perry")
    driver.find_element(by=By.ID, value="postal-code").send_keys("90210")
    driver.find_element(by=By.ID, value="continue").click()

    assert "https://www.saucedemo.com/checkout-step-two.html" == driver.current_url


def test_complete_checkout(driver):
    login(driver)
    checkout(driver)

    driver.find_element(by=By.ID, value="first-name").send_keys("Luke")
    driver.find_element(by=By.ID, value="last-name").send_keys("Perry")
    driver.find_element(by=By.ID, value="postal-code").send_keys("90210")
    driver.find_element(by=By.ID, value="continue").click()

    driver.find_element(by=By.ID, value="finish").click()

    assert "https://www.saucedemo.com/checkout-complete.html" == driver.current_url

    text = driver.find_element(by=By.CSS_SELECTOR, value=".complete-text")

    assert text.is_displayed()
