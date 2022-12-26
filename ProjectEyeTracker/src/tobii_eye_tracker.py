import os
import time

import tobii_research as tr


def apply_licenses(eyetracker):
  license_file_path = "..\\asset\\licences\\Tobii_Software_Development_License_Agreement___Research_use.pdf"
  print(license_file_path)
  print("Applying license from {0}.".format(license_file_path))
  with open(license_file_path, "rb") as f:
    license = f.read()
  print(tr.LicenseKey(license))
  failed_licenses_applied_as_list_of_keys = eyetracker.apply_licenses([tr.LicenseKey(license)])
  failed_licenses_applied_as_list_of_bytes = eyetracker.apply_licenses([license])
  failed_licenses_applied_as_key = eyetracker.apply_licenses(tr.LicenseKey(license))
  failed_licenses_applied_as_bytes = eyetracker.apply_licenses(license)
  if len(failed_licenses_applied_as_list_of_keys) == 0:
    print("Successfully applied license from list of keys.")
  else:
    print("Failed to apply license from list of keys. Validation result: {0}.".
      format(failed_licenses_applied_as_list_of_keys[0].validation_result))
  if len(failed_licenses_applied_as_list_of_bytes) == 0:
    print("Successfully applied license from list of bytes.")
  else:
    print("Failed to apply license from list of bytes. Validation result: {0}.".
      format(failed_licenses_applied_as_list_of_bytes[0].validation_result))
  if len(failed_licenses_applied_as_key) == 0:
    print("Successfully applied license from single key.")
  else:
    print("Failed to apply license from single key. Validation result: {0}.".
      format(failed_licenses_applied_as_key[0].validation_result))
  if len(failed_licenses_applied_as_bytes) == 0:
      print("Successfully applied license from bytes object.")
  else:
    print("Failed to apply license from bytes object. Validation result: {0}.".
      format(failed_licenses_applied_as_bytes[0].validation_result))


found_eyetrackers = tr.find_all_eyetrackers()
eyetracker  = found_eyetrackers[0]
apply_licenses(eyetracker)
print("Address: " + eyetracker .address)
print("Model: " + eyetracker .model)
print("Name (It's OK if this is empty): " + eyetracker .device_name)
print("Serial number: " + eyetracker .serial_number)

if tr.CAPABILITY_CAN_SET_DISPLAY_AREA in eyetracker.device_capabilities:
    print("The display area can be set on the eye tracker.")
else:
    print("The display area can not be set on the eye tracker.")


# Define a callback function to process the gaze data
def gaze_data_callback(gaze_data):
  print("Call_back")
  print(gaze_data)
  x = gaze_data["left_gaze_point_on_display_area"][0]
  y = gaze_data["left_gaze_point_on_display_area"][1]
    
  # Print the gaze point coordinates
  print(f"Gaze point coordinates: ({x}, {y})")
    
eyetracker.subscribe_to(tr.EYETRACKER_GAZE_DATA, gaze_data_callback, as_dictionary=True)
time.sleep(5)
eyetracker.unsubscribe_from(tr.EYETRACKER_GAZE_DATA, gaze_data_callback)
