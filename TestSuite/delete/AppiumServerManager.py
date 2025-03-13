from appium.webdriver.appium_service import AppiumService
from win32com.client.gencache import __init__


class AppiumServerManager:

    def __init__(self):
        self.appium_service = AppiumService()


    def start_appium_server(self, port=4723):
        self.appium_service.start(args = [
            '-p',
            str(port),
         ])


    def stop_appium_server(self):
          self.appium_service.stop()

