import unittest 
import sys
sys.path.append("..")
from ProjectEyeTracker.main import start_application

class TestGui(unittest.TestCase):
    
    async def _start_app(self):
        self.app.mainloop()
    
    def setUp(self):
        self.app = start_application()
        self._start_app()
    
    def tearDown(self):
        self.app.destroy()
    
    def test_startup(self):
        title = self.app.winfo_toplevel().title()
        expected = "Eye Tracker"
        self.assertEqual(title, expected)

if __name__ == '__main__':
    unittest.main()