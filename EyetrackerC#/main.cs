using System;
using System.Collections.Generic;
using System.Diagnostics;
using Tobii.StreamEngine;

namespace Tobii.StreamEngine.Sample
{
    public static class StreamSample
    {
        private static void OnGazePoint(ref tobii_gaze_point_t gazePoint, IntPtr userData) 
        {
            // Check that the data is valid before using it
            if(gazePoint.validity == tobii_validity_t.TOBII_VALIDITY_VALID) 
            {
                Console.WriteLine($"Gaze point: {gazePoint.position.x}, {gazePoint.position.y}");
            }
        }

        public static void Main()
        {
            // Create API context
            IntPtr apiContext;
            tobii_error_t result = Interop.tobii_api_create(out apiContext, null);
            Debug.Assert(result == tobii_error_t.TOBII_ERROR_NO_ERROR);

            // Enumerate devices to find connected eye trackers
            List<string> urls;
            result = Interop.tobii_enumerate_local_device_urls(apiContext, out urls);
            Debug.Assert(result == tobii_error_t.TOBII_ERROR_NO_ERROR);
            if(urls.Count == 0)
            {
                Console.WriteLine("Error: No device found");
                return;
            }

            // Connect to the first tracker found
            IntPtr deviceContext;
            result = Interop.tobii_device_create(apiContext, urls[0], Interop.tobii_field_of_use_t.TOBII_FIELD_OF_USE_STORE_OR_TRANSFER_FALSE, out deviceContext);
            Debug.Assert(result == tobii_error_t.TOBII_ERROR_NO_ERROR);

            // Subscribe to gaze data
            result = Interop.tobii_gaze_point_subscribe(deviceContext, OnGazePoint);
            Debug.Assert(result == tobii_error_t.TOBII_ERROR_NO_ERROR);

            // This sample will collect 1000 gaze points
            for ( int i=0; i<1000; i++ )
            {
                // Optionally block this thread until data is available. Especially useful if running in a separate thread.
                Interop.tobii_wait_for_callbacks(new [] { deviceContext });
                Debug.Assert(result == tobii_error_t.TOBII_ERROR_NO_ERROR || result == tobii_error_t.TOBII_ERROR_TIMED_OUT);
                
                // Process callbacks on this thread if data is available
                Interop.tobii_device_process_callbacks(deviceContext);
                Debug.Assert(result == tobii_error_t.TOBII_ERROR_NO_ERROR);
            }

            // Cleanup
            result = Interop.tobii_gaze_point_unsubscribe(deviceContext);
            Debug.Assert(result == tobii_error_t.TOBII_ERROR_NO_ERROR);
            result = Interop.tobii_device_destroy(deviceContext);
            Debug.Assert(result == tobii_error_t.TOBII_ERROR_NO_ERROR);
            result = Interop.tobii_api_destroy(apiContext);
            Debug.Assert(result == tobii_error_t.TOBII_ERROR_NO_ERROR);
        }
    }
}