import time

from selenium.webdriver.common.by import By

def login(driver):
    driver.get("https://www.saucedemo.com/")

    driver.find_element(by=By.ID, value="user-name").send_keys("standard_user")
    driver.find_element(by=By.ID, value="password").send_keys("secret_sauce")
    driver.find_element(by=By.ID, value="login-button").click()


def test_add_from_product(driver):
    login(driver)

    driver.find_element(by=By.ID, value="item_1_title_link").click()
    driver.find_element(by=By.ID, value="add-to-cart-sauce-labs-bolt-t-shirt").click()

    items = driver.find_element(by=By.CSS_SELECTOR, value=".shopping_cart_badge")
    assert "1" == items.text


def test_remove_from_product(driver):
    login(driver)

    driver.find_element(by=By.ID, value="item_1_title_link").click()
    driver.find_element(by=By.ID, value="add-to-cart-sauce-labs-bolt-t-shirt").click()

    driver.find_element(by=By.ID, value="remove-sauce-labs-bolt-t-shirt").click()

    items = driver.find_elements(by=By.CSS_SELECTOR, value=".shopping_cart_badge")
    assert 0 == len(items)


def test_add_from_inventory(driver):
    login(driver)

    driver.find_element(by=By.ID, value="add-to-cart-sauce-labs-onesie").click()

    items = driver.find_element(by=By.CSS_SELECTOR, value=".shopping_cart_badge")
    assert "1" == items.text


def test_remove_from_inventory(driver):
    login(driver)
    driver.find_element(by=By.ID, value="add-to-cart-sauce-labs-bike-light").click()

    driver.find_element(by=By.ID, value="remove-sauce-labs-bike-light").click()

    items = driver.find_elements(by=By.CSS_SELECTOR, value=".shopping_cart_badge")
    assert 0 == len(items)


def test_remove_from_cart(driver):
    login(driver)
    driver.find_element(by=By.ID, value="add-to-cart-sauce-labs-backpack").click()
    driver.find_element(by=By.CSS_SELECTOR, value=".shopping_cart_link").click()

    driver.find_element(by=By.ID, value="remove-sauce-labs-backpack").click()

    items = driver.find_elements(by=By.CSS_SELECTOR, value=".shopping_cart_badge")
    assert 0 == len(items)
