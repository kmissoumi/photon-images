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


def test_checkout(driver):
    login(driver)
    checkout(driver)

    assert "https://www.saucedemo.com/checkout-step-one.html" == driver.current_url


def test_cancel_from_cart(driver):
    login(driver)

    driver.find_element(by=By.CSS_SELECTOR, value=".shopping_cart_link").click()
    driver.find_element(by=By.ID, value="continue-shopping").click()

    assert "https://www.saucedemo.com/inventory.html" == driver.current_url


def test_cancel_from_info_page(driver):
    login(driver)
    checkout(driver)

    driver.find_element(by=By.ID, value="cancel").click()

    assert "https://www.saucedemo.com/cart.html" == driver.current_url


def test_cancel_from_checkout_page(driver):
    login(driver)
    checkout(driver)

    driver.find_element(by=By.ID, value="first-name").send_keys("Luke")
    driver.find_element(by=By.ID, value="last-name").send_keys("Perry")
    driver.find_element(by=By.ID, value="postal-code").send_keys("90210")
    driver.find_element(by=By.ID, value="continue").click()

    driver.find_element(by=By.ID, value="cancel").click()

    assert "https://www.saucedemo.com/inventory.html" == driver.current_url
