from appium.webdriver.appium_service import AppiumService

class AppiumServerManagerDemo:

    def __init__(self):
        self.appium_service = AppiumService()

    def start_appium_service(self, port=4723):
        self.appium_service.start(

            args=[

                '-p',
                str(port),
            ]

        )
    def stop_appium_service(self):
        self.appium_service.stop()
