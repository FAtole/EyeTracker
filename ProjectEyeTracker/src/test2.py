from psychopy.iohub import launchHubServer
from psychopy.core import getTime, wait

iohub_config = {'eyetracker.hw.tobii.EyeTracker':
    {'name': 'tracker', 'runtime_settings': {'sampling_rate': 120}}}

io = launchHubServer(**iohub_config)

# Get the eye tracker device.
tracker = io.devices.tracker

# run eyetracker calibration
r = tracker.runSetupProcedure()

# Check for and print any eye tracker events received...
tracker.setRecordingState(True)

stime = getTime()
while getTime()-stime < 2.0:
    for e in tracker.getEvents():
        print(e)

tracker.setRecordingState(False)

# Stop the ioHub Server
io.quit()