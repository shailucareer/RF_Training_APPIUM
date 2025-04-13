from appium.webdriver.common.appiumby import AppiumBy

class PythonActionPerform:

    def click_using_python(self, driver, xpath):
        print(f"Perform Click using python code on element {xpath} with xpath")
        driver.find_element(by=AppiumBy.XPATH, value=xpath).click()

