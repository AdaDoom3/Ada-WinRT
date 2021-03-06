--------------------------------------------------------------------------------
--                                                                            --
--    Copyright(c) 2018 Alexander Gamper, All Rights Reserved.                --
--                                                                            --
--    Ada-WinRT                                                               --
--    Version   : 0.1.0.1                                                     --
--                                                                            --
-- This program is free software: you can redistribute it and / or modify     --
-- it under the terms of the GNU Lesser General Public License as published by--
-- the Free Software Foundation, either version 3 of the License, or          --
-- (at your option) any later version.                                        --
--                                                                            --
-- This program is distributed in the hope that it will be useful,            --
-- but WITHOUT ANY WARRANTY; without even the implied warranty of             --
-- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the               --
-- GNU Lesser General Public License for more details.                        --
--                                                                            --
-- You should have received a copy of the GNU Lesser General Public License   --
-- along with this program.If not, see < http://www.gnu.org/licenses/>.       --
--                                                                            --
--------------------------------------------------------------------------------
with Windows.Foundation;
limited with Windows.Graphics.Display;
with Windows.Foundation.Collections;
--------------------------------------------------------------------------------
package Windows.Devices.Sensors is

   pragma preelaborate;
   
   ------------------------------------------------------------------------
   -- Enums
   ------------------------------------------------------------------------
   
   type MagnetometerAccuracy is (
      Unknown,
      Unreliable,
      Approximate,
      High
   );
   for MagnetometerAccuracy use (
      Unknown => 0,
      Unreliable => 1,
      Approximate => 2,
      High => 3
   );
   for MagnetometerAccuracy'Size use 32;
   
   type MagnetometerAccuracy_Ptr is access MagnetometerAccuracy;
   
   type ActivityType is (
      Unknown,
      Idle,
      Stationary,
      Fidgeting,
      Walking,
      Running,
      InVehicle,
      Biking
   );
   for ActivityType use (
      Unknown => 0,
      Idle => 1,
      Stationary => 2,
      Fidgeting => 3,
      Walking => 4,
      Running => 5,
      InVehicle => 6,
      Biking => 7
   );
   for ActivityType'Size use 32;
   
   type ActivityType_Ptr is access ActivityType;
   
   type ActivitySensorReadingConfidence is (
      High,
      Low
   );
   for ActivitySensorReadingConfidence use (
      High => 0,
      Low => 1
   );
   for ActivitySensorReadingConfidence'Size use 32;
   
   type ActivitySensorReadingConfidence_Ptr is access ActivitySensorReadingConfidence;
   
   type SensorReadingType is (
      Absolute,
      Relative
   );
   for SensorReadingType use (
      Absolute => 0,
      Relative => 1
   );
   for SensorReadingType'Size use 32;
   
   type SensorReadingType_Ptr is access SensorReadingType;
   
   type AccelerometerReadingType is (
      Standard_x,
      Linear,
      Gravity
   );
   for AccelerometerReadingType use (
      Standard_x => 0,
      Linear => 1,
      Gravity => 2
   );
   for AccelerometerReadingType'Size use 32;
   
   type AccelerometerReadingType_Ptr is access AccelerometerReadingType;
   
   type SensorOptimizationGoal is (
      Precision,
      PowerEfficiency
   );
   for SensorOptimizationGoal use (
      Precision => 0,
      PowerEfficiency => 1
   );
   for SensorOptimizationGoal'Size use 32;
   
   type SensorOptimizationGoal_Ptr is access SensorOptimizationGoal;
   
   type SensorType is (
      Accelerometer_x,
      ActivitySensor_x,
      Barometer_x,
      Compass_x,
      CustomSensor,
      Gyroscope,
      ProximitySensor_x,
      Inclinometer_x,
      LightSensor_x,
      OrientationSensor_x,
      Pedometer_x,
      RelativeInclinometer,
      RelativeOrientationSensor,
      SimpleOrientationSensor_x
   );
   for SensorType use (
      Accelerometer_x => 0,
      ActivitySensor_x => 1,
      Barometer_x => 2,
      Compass_x => 3,
      CustomSensor => 4,
      Gyroscope => 5,
      ProximitySensor_x => 6,
      Inclinometer_x => 7,
      LightSensor_x => 8,
      OrientationSensor_x => 9,
      Pedometer_x => 10,
      RelativeInclinometer => 11,
      RelativeOrientationSensor => 12,
      SimpleOrientationSensor_x => 13
   );
   for SensorType'Size use 32;
   
   type SensorType_Ptr is access SensorType;
   
   type SimpleOrientation is (
      NotRotated,
      Rotated90DegreesCounterclockwise,
      Rotated180DegreesCounterclockwise,
      Rotated270DegreesCounterclockwise,
      Faceup,
      Facedown
   );
   for SimpleOrientation use (
      NotRotated => 0,
      Rotated90DegreesCounterclockwise => 1,
      Rotated180DegreesCounterclockwise => 2,
      Rotated270DegreesCounterclockwise => 3,
      Faceup => 4,
      Facedown => 5
   );
   for SimpleOrientation'Size use 32;
   
   type SimpleOrientation_Ptr is access SimpleOrientation;
   
   type PedometerStepKind is (
      Unknown,
      Walking,
      Running
   );
   for PedometerStepKind use (
      Unknown => 0,
      Walking => 1,
      Running => 2
   );
   for PedometerStepKind'Size use 32;
   
   type PedometerStepKind_Ptr is access PedometerStepKind;
   
   ------------------------------------------------------------------------
   -- Forward Declaration - Delegates/Events
   ------------------------------------------------------------------------
   
   type AsyncOperationCompletedHandler_IAccelerometer_Interface;
   type AsyncOperationCompletedHandler_IAccelerometer is access all AsyncOperationCompletedHandler_IAccelerometer_Interface'Class;
   type AsyncOperationCompletedHandler_IAccelerometer_Ptr is access all AsyncOperationCompletedHandler_IAccelerometer;
   type TypedEventHandler_IAccelerometer_add_ReadingChanged_Interface;
   type TypedEventHandler_IAccelerometer_add_ReadingChanged is access all TypedEventHandler_IAccelerometer_add_ReadingChanged_Interface'Class;
   type TypedEventHandler_IAccelerometer_add_ReadingChanged_Ptr is access all TypedEventHandler_IAccelerometer_add_ReadingChanged;
   type TypedEventHandler_IAccelerometer_add_Shaken_Interface;
   type TypedEventHandler_IAccelerometer_add_Shaken is access all TypedEventHandler_IAccelerometer_add_Shaken_Interface'Class;
   type TypedEventHandler_IAccelerometer_add_Shaken_Ptr is access all TypedEventHandler_IAccelerometer_add_Shaken;
   type AsyncOperationCompletedHandler_IInclinometer_Interface;
   type AsyncOperationCompletedHandler_IInclinometer is access all AsyncOperationCompletedHandler_IInclinometer_Interface'Class;
   type AsyncOperationCompletedHandler_IInclinometer_Ptr is access all AsyncOperationCompletedHandler_IInclinometer;
   type TypedEventHandler_IInclinometer_add_ReadingChanged_Interface;
   type TypedEventHandler_IInclinometer_add_ReadingChanged is access all TypedEventHandler_IInclinometer_add_ReadingChanged_Interface'Class;
   type TypedEventHandler_IInclinometer_add_ReadingChanged_Ptr is access all TypedEventHandler_IInclinometer_add_ReadingChanged;
   type AsyncOperationCompletedHandler_IGyrometer_Interface;
   type AsyncOperationCompletedHandler_IGyrometer is access all AsyncOperationCompletedHandler_IGyrometer_Interface'Class;
   type AsyncOperationCompletedHandler_IGyrometer_Ptr is access all AsyncOperationCompletedHandler_IGyrometer;
   type TypedEventHandler_IGyrometer_add_ReadingChanged_Interface;
   type TypedEventHandler_IGyrometer_add_ReadingChanged is access all TypedEventHandler_IGyrometer_add_ReadingChanged_Interface'Class;
   type TypedEventHandler_IGyrometer_add_ReadingChanged_Ptr is access all TypedEventHandler_IGyrometer_add_ReadingChanged;
   type AsyncOperationCompletedHandler_ICompass_Interface;
   type AsyncOperationCompletedHandler_ICompass is access all AsyncOperationCompletedHandler_ICompass_Interface'Class;
   type AsyncOperationCompletedHandler_ICompass_Ptr is access all AsyncOperationCompletedHandler_ICompass;
   type TypedEventHandler_ICompass_add_ReadingChanged_Interface;
   type TypedEventHandler_ICompass_add_ReadingChanged is access all TypedEventHandler_ICompass_add_ReadingChanged_Interface'Class;
   type TypedEventHandler_ICompass_add_ReadingChanged_Ptr is access all TypedEventHandler_ICompass_add_ReadingChanged;
   type AsyncOperationCompletedHandler_ILightSensor_Interface;
   type AsyncOperationCompletedHandler_ILightSensor is access all AsyncOperationCompletedHandler_ILightSensor_Interface'Class;
   type AsyncOperationCompletedHandler_ILightSensor_Ptr is access all AsyncOperationCompletedHandler_ILightSensor;
   type TypedEventHandler_ILightSensor_add_ReadingChanged_Interface;
   type TypedEventHandler_ILightSensor_add_ReadingChanged is access all TypedEventHandler_ILightSensor_add_ReadingChanged_Interface'Class;
   type TypedEventHandler_ILightSensor_add_ReadingChanged_Ptr is access all TypedEventHandler_ILightSensor_add_ReadingChanged;
   type AsyncOperationCompletedHandler_IOrientationSensor_Interface;
   type AsyncOperationCompletedHandler_IOrientationSensor is access all AsyncOperationCompletedHandler_IOrientationSensor_Interface'Class;
   type AsyncOperationCompletedHandler_IOrientationSensor_Ptr is access all AsyncOperationCompletedHandler_IOrientationSensor;
   type TypedEventHandler_IOrientationSensor_add_ReadingChanged_Interface;
   type TypedEventHandler_IOrientationSensor_add_ReadingChanged is access all TypedEventHandler_IOrientationSensor_add_ReadingChanged_Interface'Class;
   type TypedEventHandler_IOrientationSensor_add_ReadingChanged_Ptr is access all TypedEventHandler_IOrientationSensor_add_ReadingChanged;
   type TypedEventHandler_ISimpleOrientationSensor_add_OrientationChanged_Interface;
   type TypedEventHandler_ISimpleOrientationSensor_add_OrientationChanged is access all TypedEventHandler_ISimpleOrientationSensor_add_OrientationChanged_Interface'Class;
   type TypedEventHandler_ISimpleOrientationSensor_add_OrientationChanged_Ptr is access all TypedEventHandler_ISimpleOrientationSensor_add_OrientationChanged;
   type AsyncOperationCompletedHandler_IMagnetometer_Interface;
   type AsyncOperationCompletedHandler_IMagnetometer is access all AsyncOperationCompletedHandler_IMagnetometer_Interface'Class;
   type AsyncOperationCompletedHandler_IMagnetometer_Ptr is access all AsyncOperationCompletedHandler_IMagnetometer;
   type TypedEventHandler_IMagnetometer_add_ReadingChanged_Interface;
   type TypedEventHandler_IMagnetometer_add_ReadingChanged is access all TypedEventHandler_IMagnetometer_add_ReadingChanged_Interface'Class;
   type TypedEventHandler_IMagnetometer_add_ReadingChanged_Ptr is access all TypedEventHandler_IMagnetometer_add_ReadingChanged;
   type AsyncOperationCompletedHandler_IActivitySensor_Interface;
   type AsyncOperationCompletedHandler_IActivitySensor is access all AsyncOperationCompletedHandler_IActivitySensor_Interface'Class;
   type AsyncOperationCompletedHandler_IActivitySensor_Ptr is access all AsyncOperationCompletedHandler_IActivitySensor;
   type AsyncOperationCompletedHandler_IActivitySensorReading_Interface;
   type AsyncOperationCompletedHandler_IActivitySensorReading is access all AsyncOperationCompletedHandler_IActivitySensorReading_Interface'Class;
   type AsyncOperationCompletedHandler_IActivitySensorReading_Ptr is access all AsyncOperationCompletedHandler_IActivitySensorReading;
   type TypedEventHandler_IActivitySensor_add_ReadingChanged_Interface;
   type TypedEventHandler_IActivitySensor_add_ReadingChanged is access all TypedEventHandler_IActivitySensor_add_ReadingChanged_Interface'Class;
   type TypedEventHandler_IActivitySensor_add_ReadingChanged_Ptr is access all TypedEventHandler_IActivitySensor_add_ReadingChanged;
   type AsyncOperationCompletedHandler_IBarometer_Interface;
   type AsyncOperationCompletedHandler_IBarometer is access all AsyncOperationCompletedHandler_IBarometer_Interface'Class;
   type AsyncOperationCompletedHandler_IBarometer_Ptr is access all AsyncOperationCompletedHandler_IBarometer;
   type TypedEventHandler_IBarometer_add_ReadingChanged_Interface;
   type TypedEventHandler_IBarometer_add_ReadingChanged is access all TypedEventHandler_IBarometer_add_ReadingChanged_Interface'Class;
   type TypedEventHandler_IBarometer_add_ReadingChanged_Ptr is access all TypedEventHandler_IBarometer_add_ReadingChanged;
   type AsyncOperationCompletedHandler_IPedometer_Interface;
   type AsyncOperationCompletedHandler_IPedometer is access all AsyncOperationCompletedHandler_IPedometer_Interface'Class;
   type AsyncOperationCompletedHandler_IPedometer_Ptr is access all AsyncOperationCompletedHandler_IPedometer;
   type TypedEventHandler_IPedometer_add_ReadingChanged_Interface;
   type TypedEventHandler_IPedometer_add_ReadingChanged is access all TypedEventHandler_IPedometer_add_ReadingChanged_Interface'Class;
   type TypedEventHandler_IPedometer_add_ReadingChanged_Ptr is access all TypedEventHandler_IPedometer_add_ReadingChanged;
   type TypedEventHandler_IProximitySensor_add_ReadingChanged_Interface;
   type TypedEventHandler_IProximitySensor_add_ReadingChanged is access all TypedEventHandler_IProximitySensor_add_ReadingChanged_Interface'Class;
   type TypedEventHandler_IProximitySensor_add_ReadingChanged_Ptr is access all TypedEventHandler_IProximitySensor_add_ReadingChanged;
   type TypedEventHandler_IAltimeter_add_ReadingChanged_Interface;
   type TypedEventHandler_IAltimeter_add_ReadingChanged is access all TypedEventHandler_IAltimeter_add_ReadingChanged_Interface'Class;
   type TypedEventHandler_IAltimeter_add_ReadingChanged_Ptr is access all TypedEventHandler_IAltimeter_add_ReadingChanged;
   
   ------------------------------------------------------------------------
   -- Forward Declaration - Interfaces
   ------------------------------------------------------------------------
   
   type ISensorDataThreshold_Interface;
   type ISensorDataThreshold is access all ISensorDataThreshold_Interface'Class;
   type ISensorDataThreshold_Ptr is access all ISensorDataThreshold;
   type ISensorDataThresholdTriggerDetails_Interface;
   type ISensorDataThresholdTriggerDetails is access all ISensorDataThresholdTriggerDetails_Interface'Class;
   type ISensorDataThresholdTriggerDetails_Ptr is access all ISensorDataThresholdTriggerDetails;
   type IAccelerometerDeviceId_Interface;
   type IAccelerometerDeviceId is access all IAccelerometerDeviceId_Interface'Class;
   type IAccelerometerDeviceId_Ptr is access all IAccelerometerDeviceId;
   type IAccelerometerStatics_Interface;
   type IAccelerometerStatics is access all IAccelerometerStatics_Interface'Class;
   type IAccelerometerStatics_Ptr is access all IAccelerometerStatics;
   type IAccelerometerStatics2_Interface;
   type IAccelerometerStatics2 is access all IAccelerometerStatics2_Interface'Class;
   type IAccelerometerStatics2_Ptr is access all IAccelerometerStatics2;
   type IAccelerometerStatics3_Interface;
   type IAccelerometerStatics3 is access all IAccelerometerStatics3_Interface'Class;
   type IAccelerometerStatics3_Ptr is access all IAccelerometerStatics3;
   type IAccelerometer_Interface;
   type IAccelerometer is access all IAccelerometer_Interface'Class;
   type IAccelerometer_Ptr is access all IAccelerometer;
   type IAccelerometer2_Interface;
   type IAccelerometer2 is access all IAccelerometer2_Interface'Class;
   type IAccelerometer2_Ptr is access all IAccelerometer2;
   type IAccelerometer3_Interface;
   type IAccelerometer3 is access all IAccelerometer3_Interface'Class;
   type IAccelerometer3_Ptr is access all IAccelerometer3;
   type IAccelerometer4_Interface;
   type IAccelerometer4 is access all IAccelerometer4_Interface'Class;
   type IAccelerometer4_Ptr is access all IAccelerometer4;
   type IAccelerometerReading_Interface;
   type IAccelerometerReading is access all IAccelerometerReading_Interface'Class;
   type IAccelerometerReading_Ptr is access all IAccelerometerReading;
   type IAccelerometerReading2_Interface;
   type IAccelerometerReading2 is access all IAccelerometerReading2_Interface'Class;
   type IAccelerometerReading2_Ptr is access all IAccelerometerReading2;
   type IAccelerometerReadingChangedEventArgs_Interface;
   type IAccelerometerReadingChangedEventArgs is access all IAccelerometerReadingChangedEventArgs_Interface'Class;
   type IAccelerometerReadingChangedEventArgs_Ptr is access all IAccelerometerReadingChangedEventArgs;
   type IAccelerometerShakenEventArgs_Interface;
   type IAccelerometerShakenEventArgs is access all IAccelerometerShakenEventArgs_Interface'Class;
   type IAccelerometerShakenEventArgs_Ptr is access all IAccelerometerShakenEventArgs;
   type IInclinometerDeviceId_Interface;
   type IInclinometerDeviceId is access all IInclinometerDeviceId_Interface'Class;
   type IInclinometerDeviceId_Ptr is access all IInclinometerDeviceId;
   type IInclinometerStatics_Interface;
   type IInclinometerStatics is access all IInclinometerStatics_Interface'Class;
   type IInclinometerStatics_Ptr is access all IInclinometerStatics;
   type IInclinometerStatics2_Interface;
   type IInclinometerStatics2 is access all IInclinometerStatics2_Interface'Class;
   type IInclinometerStatics2_Ptr is access all IInclinometerStatics2;
   type IInclinometerStatics3_Interface;
   type IInclinometerStatics3 is access all IInclinometerStatics3_Interface'Class;
   type IInclinometerStatics3_Ptr is access all IInclinometerStatics3;
   type IInclinometerStatics4_Interface;
   type IInclinometerStatics4 is access all IInclinometerStatics4_Interface'Class;
   type IInclinometerStatics4_Ptr is access all IInclinometerStatics4;
   type IInclinometer_Interface;
   type IInclinometer is access all IInclinometer_Interface'Class;
   type IInclinometer_Ptr is access all IInclinometer;
   type IInclinometer2_Interface;
   type IInclinometer2 is access all IInclinometer2_Interface'Class;
   type IInclinometer2_Ptr is access all IInclinometer2;
   type IInclinometer3_Interface;
   type IInclinometer3 is access all IInclinometer3_Interface'Class;
   type IInclinometer3_Ptr is access all IInclinometer3;
   type IInclinometerReading_Interface;
   type IInclinometerReading is access all IInclinometerReading_Interface'Class;
   type IInclinometerReading_Ptr is access all IInclinometerReading;
   type IInclinometerReading2_Interface;
   type IInclinometerReading2 is access all IInclinometerReading2_Interface'Class;
   type IInclinometerReading2_Ptr is access all IInclinometerReading2;
   type IInclinometerReadingYawAccuracy_Interface;
   type IInclinometerReadingYawAccuracy is access all IInclinometerReadingYawAccuracy_Interface'Class;
   type IInclinometerReadingYawAccuracy_Ptr is access all IInclinometerReadingYawAccuracy;
   type IInclinometerReadingChangedEventArgs_Interface;
   type IInclinometerReadingChangedEventArgs is access all IInclinometerReadingChangedEventArgs_Interface'Class;
   type IInclinometerReadingChangedEventArgs_Ptr is access all IInclinometerReadingChangedEventArgs;
   type IGyrometerDeviceId_Interface;
   type IGyrometerDeviceId is access all IGyrometerDeviceId_Interface'Class;
   type IGyrometerDeviceId_Ptr is access all IGyrometerDeviceId;
   type IGyrometerStatics_Interface;
   type IGyrometerStatics is access all IGyrometerStatics_Interface'Class;
   type IGyrometerStatics_Ptr is access all IGyrometerStatics;
   type IGyrometerStatics2_Interface;
   type IGyrometerStatics2 is access all IGyrometerStatics2_Interface'Class;
   type IGyrometerStatics2_Ptr is access all IGyrometerStatics2;
   type IGyrometer_Interface;
   type IGyrometer is access all IGyrometer_Interface'Class;
   type IGyrometer_Ptr is access all IGyrometer;
   type IGyrometer2_Interface;
   type IGyrometer2 is access all IGyrometer2_Interface'Class;
   type IGyrometer2_Ptr is access all IGyrometer2;
   type IGyrometer3_Interface;
   type IGyrometer3 is access all IGyrometer3_Interface'Class;
   type IGyrometer3_Ptr is access all IGyrometer3;
   type IGyrometerReading_Interface;
   type IGyrometerReading is access all IGyrometerReading_Interface'Class;
   type IGyrometerReading_Ptr is access all IGyrometerReading;
   type IGyrometerReading2_Interface;
   type IGyrometerReading2 is access all IGyrometerReading2_Interface'Class;
   type IGyrometerReading2_Ptr is access all IGyrometerReading2;
   type IGyrometerReadingChangedEventArgs_Interface;
   type IGyrometerReadingChangedEventArgs is access all IGyrometerReadingChangedEventArgs_Interface'Class;
   type IGyrometerReadingChangedEventArgs_Ptr is access all IGyrometerReadingChangedEventArgs;
   type ICompassDeviceId_Interface;
   type ICompassDeviceId is access all ICompassDeviceId_Interface'Class;
   type ICompassDeviceId_Ptr is access all ICompassDeviceId;
   type ICompassStatics_Interface;
   type ICompassStatics is access all ICompassStatics_Interface'Class;
   type ICompassStatics_Ptr is access all ICompassStatics;
   type ICompassStatics2_Interface;
   type ICompassStatics2 is access all ICompassStatics2_Interface'Class;
   type ICompassStatics2_Ptr is access all ICompassStatics2;
   type ICompass_Interface;
   type ICompass is access all ICompass_Interface'Class;
   type ICompass_Ptr is access all ICompass;
   type ICompass2_Interface;
   type ICompass2 is access all ICompass2_Interface'Class;
   type ICompass2_Ptr is access all ICompass2;
   type ICompass3_Interface;
   type ICompass3 is access all ICompass3_Interface'Class;
   type ICompass3_Ptr is access all ICompass3;
   type ICompassReading_Interface;
   type ICompassReading is access all ICompassReading_Interface'Class;
   type ICompassReading_Ptr is access all ICompassReading;
   type ICompassReading2_Interface;
   type ICompassReading2 is access all ICompassReading2_Interface'Class;
   type ICompassReading2_Ptr is access all ICompassReading2;
   type ICompassReadingHeadingAccuracy_Interface;
   type ICompassReadingHeadingAccuracy is access all ICompassReadingHeadingAccuracy_Interface'Class;
   type ICompassReadingHeadingAccuracy_Ptr is access all ICompassReadingHeadingAccuracy;
   type ICompassReadingChangedEventArgs_Interface;
   type ICompassReadingChangedEventArgs is access all ICompassReadingChangedEventArgs_Interface'Class;
   type ICompassReadingChangedEventArgs_Ptr is access all ICompassReadingChangedEventArgs;
   type ILightSensorDeviceId_Interface;
   type ILightSensorDeviceId is access all ILightSensorDeviceId_Interface'Class;
   type ILightSensorDeviceId_Ptr is access all ILightSensorDeviceId;
   type ILightSensorStatics_Interface;
   type ILightSensorStatics is access all ILightSensorStatics_Interface'Class;
   type ILightSensorStatics_Ptr is access all ILightSensorStatics;
   type ILightSensorStatics2_Interface;
   type ILightSensorStatics2 is access all ILightSensorStatics2_Interface'Class;
   type ILightSensorStatics2_Ptr is access all ILightSensorStatics2;
   type ILightSensor_Interface;
   type ILightSensor is access all ILightSensor_Interface'Class;
   type ILightSensor_Ptr is access all ILightSensor;
   type ILightSensor2_Interface;
   type ILightSensor2 is access all ILightSensor2_Interface'Class;
   type ILightSensor2_Ptr is access all ILightSensor2;
   type ILightSensorReading_Interface;
   type ILightSensorReading is access all ILightSensorReading_Interface'Class;
   type ILightSensorReading_Ptr is access all ILightSensorReading;
   type ILightSensorReading2_Interface;
   type ILightSensorReading2 is access all ILightSensorReading2_Interface'Class;
   type ILightSensorReading2_Ptr is access all ILightSensorReading2;
   type ILightSensorReadingChangedEventArgs_Interface;
   type ILightSensorReadingChangedEventArgs is access all ILightSensorReadingChangedEventArgs_Interface'Class;
   type ILightSensorReadingChangedEventArgs_Ptr is access all ILightSensorReadingChangedEventArgs;
   type ISensorRotationMatrix_Interface;
   type ISensorRotationMatrix is access all ISensorRotationMatrix_Interface'Class;
   type ISensorRotationMatrix_Ptr is access all ISensorRotationMatrix;
   type ISensorQuaternion_Interface;
   type ISensorQuaternion is access all ISensorQuaternion_Interface'Class;
   type ISensorQuaternion_Ptr is access all ISensorQuaternion;
   type IOrientationSensorDeviceId_Interface;
   type IOrientationSensorDeviceId is access all IOrientationSensorDeviceId_Interface'Class;
   type IOrientationSensorDeviceId_Ptr is access all IOrientationSensorDeviceId;
   type IOrientationSensorStatics_Interface;
   type IOrientationSensorStatics is access all IOrientationSensorStatics_Interface'Class;
   type IOrientationSensorStatics_Ptr is access all IOrientationSensorStatics;
   type IOrientationSensorStatics2_Interface;
   type IOrientationSensorStatics2 is access all IOrientationSensorStatics2_Interface'Class;
   type IOrientationSensorStatics2_Ptr is access all IOrientationSensorStatics2;
   type IOrientationSensorStatics3_Interface;
   type IOrientationSensorStatics3 is access all IOrientationSensorStatics3_Interface'Class;
   type IOrientationSensorStatics3_Ptr is access all IOrientationSensorStatics3;
   type IOrientationSensorStatics4_Interface;
   type IOrientationSensorStatics4 is access all IOrientationSensorStatics4_Interface'Class;
   type IOrientationSensorStatics4_Ptr is access all IOrientationSensorStatics4;
   type IOrientationSensor_Interface;
   type IOrientationSensor is access all IOrientationSensor_Interface'Class;
   type IOrientationSensor_Ptr is access all IOrientationSensor;
   type IOrientationSensor2_Interface;
   type IOrientationSensor2 is access all IOrientationSensor2_Interface'Class;
   type IOrientationSensor2_Ptr is access all IOrientationSensor2;
   type IOrientationSensor3_Interface;
   type IOrientationSensor3 is access all IOrientationSensor3_Interface'Class;
   type IOrientationSensor3_Ptr is access all IOrientationSensor3;
   type IOrientationSensorReading_Interface;
   type IOrientationSensorReading is access all IOrientationSensorReading_Interface'Class;
   type IOrientationSensorReading_Ptr is access all IOrientationSensorReading;
   type IOrientationSensorReading2_Interface;
   type IOrientationSensorReading2 is access all IOrientationSensorReading2_Interface'Class;
   type IOrientationSensorReading2_Ptr is access all IOrientationSensorReading2;
   type IOrientationSensorReadingYawAccuracy_Interface;
   type IOrientationSensorReadingYawAccuracy is access all IOrientationSensorReadingYawAccuracy_Interface'Class;
   type IOrientationSensorReadingYawAccuracy_Ptr is access all IOrientationSensorReadingYawAccuracy;
   type IOrientationSensorReadingChangedEventArgs_Interface;
   type IOrientationSensorReadingChangedEventArgs is access all IOrientationSensorReadingChangedEventArgs_Interface'Class;
   type IOrientationSensorReadingChangedEventArgs_Ptr is access all IOrientationSensorReadingChangedEventArgs;
   type ISimpleOrientationSensorDeviceId_Interface;
   type ISimpleOrientationSensorDeviceId is access all ISimpleOrientationSensorDeviceId_Interface'Class;
   type ISimpleOrientationSensorDeviceId_Ptr is access all ISimpleOrientationSensorDeviceId;
   type ISimpleOrientationSensorStatics_Interface;
   type ISimpleOrientationSensorStatics is access all ISimpleOrientationSensorStatics_Interface'Class;
   type ISimpleOrientationSensorStatics_Ptr is access all ISimpleOrientationSensorStatics;
   type ISimpleOrientationSensor_Interface;
   type ISimpleOrientationSensor is access all ISimpleOrientationSensor_Interface'Class;
   type ISimpleOrientationSensor_Ptr is access all ISimpleOrientationSensor;
   type ISimpleOrientationSensor2_Interface;
   type ISimpleOrientationSensor2 is access all ISimpleOrientationSensor2_Interface'Class;
   type ISimpleOrientationSensor2_Ptr is access all ISimpleOrientationSensor2;
   type ISimpleOrientationSensorOrientationChangedEventArgs_Interface;
   type ISimpleOrientationSensorOrientationChangedEventArgs is access all ISimpleOrientationSensorOrientationChangedEventArgs_Interface'Class;
   type ISimpleOrientationSensorOrientationChangedEventArgs_Ptr is access all ISimpleOrientationSensorOrientationChangedEventArgs;
   type IMagnetometerDeviceId_Interface;
   type IMagnetometerDeviceId is access all IMagnetometerDeviceId_Interface'Class;
   type IMagnetometerDeviceId_Ptr is access all IMagnetometerDeviceId;
   type IMagnetometerStatics_Interface;
   type IMagnetometerStatics is access all IMagnetometerStatics_Interface'Class;
   type IMagnetometerStatics_Ptr is access all IMagnetometerStatics;
   type IMagnetometerStatics2_Interface;
   type IMagnetometerStatics2 is access all IMagnetometerStatics2_Interface'Class;
   type IMagnetometerStatics2_Ptr is access all IMagnetometerStatics2;
   type IMagnetometer_Interface;
   type IMagnetometer is access all IMagnetometer_Interface'Class;
   type IMagnetometer_Ptr is access all IMagnetometer;
   type IMagnetometer2_Interface;
   type IMagnetometer2 is access all IMagnetometer2_Interface'Class;
   type IMagnetometer2_Ptr is access all IMagnetometer2;
   type IMagnetometer3_Interface;
   type IMagnetometer3 is access all IMagnetometer3_Interface'Class;
   type IMagnetometer3_Ptr is access all IMagnetometer3;
   type IMagnetometerReading_Interface;
   type IMagnetometerReading is access all IMagnetometerReading_Interface'Class;
   type IMagnetometerReading_Ptr is access all IMagnetometerReading;
   type IMagnetometerReading2_Interface;
   type IMagnetometerReading2 is access all IMagnetometerReading2_Interface'Class;
   type IMagnetometerReading2_Ptr is access all IMagnetometerReading2;
   type IMagnetometerReadingChangedEventArgs_Interface;
   type IMagnetometerReadingChangedEventArgs is access all IMagnetometerReadingChangedEventArgs_Interface'Class;
   type IMagnetometerReadingChangedEventArgs_Ptr is access all IMagnetometerReadingChangedEventArgs;
   type IActivitySensorStatics_Interface;
   type IActivitySensorStatics is access all IActivitySensorStatics_Interface'Class;
   type IActivitySensorStatics_Ptr is access all IActivitySensorStatics;
   type IActivitySensor_Interface;
   type IActivitySensor is access all IActivitySensor_Interface'Class;
   type IActivitySensor_Ptr is access all IActivitySensor;
   type IActivitySensorReading_Interface;
   type IActivitySensorReading is access all IActivitySensorReading_Interface'Class;
   type IActivitySensorReading_Ptr is access all IActivitySensorReading;
   type IActivitySensorReadingChangedEventArgs_Interface;
   type IActivitySensorReadingChangedEventArgs is access all IActivitySensorReadingChangedEventArgs_Interface'Class;
   type IActivitySensorReadingChangedEventArgs_Ptr is access all IActivitySensorReadingChangedEventArgs;
   type IActivitySensorReadingChangeReport_Interface;
   type IActivitySensorReadingChangeReport is access all IActivitySensorReadingChangeReport_Interface'Class;
   type IActivitySensorReadingChangeReport_Ptr is access all IActivitySensorReadingChangeReport;
   type IActivitySensorTriggerDetails_Interface;
   type IActivitySensorTriggerDetails is access all IActivitySensorTriggerDetails_Interface'Class;
   type IActivitySensorTriggerDetails_Ptr is access all IActivitySensorTriggerDetails;
   type IBarometerStatics_Interface;
   type IBarometerStatics is access all IBarometerStatics_Interface'Class;
   type IBarometerStatics_Ptr is access all IBarometerStatics;
   type IBarometerStatics2_Interface;
   type IBarometerStatics2 is access all IBarometerStatics2_Interface'Class;
   type IBarometerStatics2_Ptr is access all IBarometerStatics2;
   type IBarometer_Interface;
   type IBarometer is access all IBarometer_Interface'Class;
   type IBarometer_Ptr is access all IBarometer;
   type IBarometer2_Interface;
   type IBarometer2 is access all IBarometer2_Interface'Class;
   type IBarometer2_Ptr is access all IBarometer2;
   type IBarometerReading_Interface;
   type IBarometerReading is access all IBarometerReading_Interface'Class;
   type IBarometerReading_Ptr is access all IBarometerReading;
   type IBarometerReading2_Interface;
   type IBarometerReading2 is access all IBarometerReading2_Interface'Class;
   type IBarometerReading2_Ptr is access all IBarometerReading2;
   type IBarometerReadingChangedEventArgs_Interface;
   type IBarometerReadingChangedEventArgs is access all IBarometerReadingChangedEventArgs_Interface'Class;
   type IBarometerReadingChangedEventArgs_Ptr is access all IBarometerReadingChangedEventArgs;
   type IPedometerReading_Interface;
   type IPedometerReading is access all IPedometerReading_Interface'Class;
   type IPedometerReading_Ptr is access all IPedometerReading;
   type IPedometerReadingChangedEventArgs_Interface;
   type IPedometerReadingChangedEventArgs is access all IPedometerReadingChangedEventArgs_Interface'Class;
   type IPedometerReadingChangedEventArgs_Ptr is access all IPedometerReadingChangedEventArgs;
   type IPedometerStatics_Interface;
   type IPedometerStatics is access all IPedometerStatics_Interface'Class;
   type IPedometerStatics_Ptr is access all IPedometerStatics;
   type IPedometerStatics2_Interface;
   type IPedometerStatics2 is access all IPedometerStatics2_Interface'Class;
   type IPedometerStatics2_Ptr is access all IPedometerStatics2;
   type IPedometer2_Interface;
   type IPedometer2 is access all IPedometer2_Interface'Class;
   type IPedometer2_Ptr is access all IPedometer2;
   type IPedometer_Interface;
   type IPedometer is access all IPedometer_Interface'Class;
   type IPedometer_Ptr is access all IPedometer;
   type IPedometerDataThresholdFactory_Interface;
   type IPedometerDataThresholdFactory is access all IPedometerDataThresholdFactory_Interface'Class;
   type IPedometerDataThresholdFactory_Ptr is access all IPedometerDataThresholdFactory;
   type IProximitySensorStatics_Interface;
   type IProximitySensorStatics is access all IProximitySensorStatics_Interface'Class;
   type IProximitySensorStatics_Ptr is access all IProximitySensorStatics;
   type IProximitySensor_Interface;
   type IProximitySensor is access all IProximitySensor_Interface'Class;
   type IProximitySensor_Ptr is access all IProximitySensor;
   type IProximitySensorReadingChangedEventArgs_Interface;
   type IProximitySensorReadingChangedEventArgs is access all IProximitySensorReadingChangedEventArgs_Interface'Class;
   type IProximitySensorReadingChangedEventArgs_Ptr is access all IProximitySensorReadingChangedEventArgs;
   type IProximitySensorReading_Interface;
   type IProximitySensorReading is access all IProximitySensorReading_Interface'Class;
   type IProximitySensorReading_Ptr is access all IProximitySensorReading;
   type IProximitySensorDataThresholdFactory_Interface;
   type IProximitySensorDataThresholdFactory is access all IProximitySensorDataThresholdFactory_Interface'Class;
   type IProximitySensorDataThresholdFactory_Ptr is access all IProximitySensorDataThresholdFactory;
   type IProximitySensorStatics2_Interface;
   type IProximitySensorStatics2 is access all IProximitySensorStatics2_Interface'Class;
   type IProximitySensorStatics2_Ptr is access all IProximitySensorStatics2;
   type IAltimeterStatics_Interface;
   type IAltimeterStatics is access all IAltimeterStatics_Interface'Class;
   type IAltimeterStatics_Ptr is access all IAltimeterStatics;
   type IAltimeter_Interface;
   type IAltimeter is access all IAltimeter_Interface'Class;
   type IAltimeter_Ptr is access all IAltimeter;
   type IAltimeter2_Interface;
   type IAltimeter2 is access all IAltimeter2_Interface'Class;
   type IAltimeter2_Ptr is access all IAltimeter2;
   type IAltimeterReading_Interface;
   type IAltimeterReading is access all IAltimeterReading_Interface'Class;
   type IAltimeterReading_Ptr is access all IAltimeterReading;
   type IAltimeterReading2_Interface;
   type IAltimeterReading2 is access all IAltimeterReading2_Interface'Class;
   type IAltimeterReading2_Ptr is access all IAltimeterReading2;
   type IAltimeterReadingChangedEventArgs_Interface;
   type IAltimeterReadingChangedEventArgs is access all IAltimeterReadingChangedEventArgs_Interface'Class;
   type IAltimeterReadingChangedEventArgs_Ptr is access all IAltimeterReadingChangedEventArgs;
   type IAsyncOperation_IAccelerometer_Interface;
   type IAsyncOperation_IAccelerometer is access all IAsyncOperation_IAccelerometer_Interface'Class;
   type IAsyncOperation_IAccelerometer_Ptr is access all IAsyncOperation_IAccelerometer;
   type IAsyncOperation_IInclinometer_Interface;
   type IAsyncOperation_IInclinometer is access all IAsyncOperation_IInclinometer_Interface'Class;
   type IAsyncOperation_IInclinometer_Ptr is access all IAsyncOperation_IInclinometer;
   type IAsyncOperation_IGyrometer_Interface;
   type IAsyncOperation_IGyrometer is access all IAsyncOperation_IGyrometer_Interface'Class;
   type IAsyncOperation_IGyrometer_Ptr is access all IAsyncOperation_IGyrometer;
   type IAsyncOperation_ICompass_Interface;
   type IAsyncOperation_ICompass is access all IAsyncOperation_ICompass_Interface'Class;
   type IAsyncOperation_ICompass_Ptr is access all IAsyncOperation_ICompass;
   type IAsyncOperation_ILightSensor_Interface;
   type IAsyncOperation_ILightSensor is access all IAsyncOperation_ILightSensor_Interface'Class;
   type IAsyncOperation_ILightSensor_Ptr is access all IAsyncOperation_ILightSensor;
   type IAsyncOperation_IOrientationSensor_Interface;
   type IAsyncOperation_IOrientationSensor is access all IAsyncOperation_IOrientationSensor_Interface'Class;
   type IAsyncOperation_IOrientationSensor_Ptr is access all IAsyncOperation_IOrientationSensor;
   type IAsyncOperation_IMagnetometer_Interface;
   type IAsyncOperation_IMagnetometer is access all IAsyncOperation_IMagnetometer_Interface'Class;
   type IAsyncOperation_IMagnetometer_Ptr is access all IAsyncOperation_IMagnetometer;
   type IAsyncOperation_IActivitySensor_Interface;
   type IAsyncOperation_IActivitySensor is access all IAsyncOperation_IActivitySensor_Interface'Class;
   type IAsyncOperation_IActivitySensor_Ptr is access all IAsyncOperation_IActivitySensor;
   type IAsyncOperation_IActivitySensorReading_Interface;
   type IAsyncOperation_IActivitySensorReading is access all IAsyncOperation_IActivitySensorReading_Interface'Class;
   type IAsyncOperation_IActivitySensorReading_Ptr is access all IAsyncOperation_IActivitySensorReading;
   type IIterator_ActivityType_Interface;
   type IIterator_ActivityType is access all IIterator_ActivityType_Interface'Class;
   type IIterator_ActivityType_Ptr is access all IIterator_ActivityType;
   type IIterable_ActivityType_Interface;
   type IIterable_ActivityType is access all IIterable_ActivityType_Interface'Class;
   type IIterable_ActivityType_Ptr is access all IIterable_ActivityType;
   type IVectorView_ActivityType_Interface;
   type IVectorView_ActivityType is access all IVectorView_ActivityType_Interface'Class;
   type IVectorView_ActivityType_Ptr is access all IVectorView_ActivityType;
   type IVector_ActivityType_Interface;
   type IVector_ActivityType is access all IVector_ActivityType_Interface'Class;
   type IVector_ActivityType_Ptr is access all IVector_ActivityType;
   type IIterator_IActivitySensorReadingChangeReport_Interface;
   type IIterator_IActivitySensorReadingChangeReport is access all IIterator_IActivitySensorReadingChangeReport_Interface'Class;
   type IIterator_IActivitySensorReadingChangeReport_Ptr is access all IIterator_IActivitySensorReadingChangeReport;
   type IIterable_IActivitySensorReadingChangeReport_Interface;
   type IIterable_IActivitySensorReadingChangeReport is access all IIterable_IActivitySensorReadingChangeReport_Interface'Class;
   type IIterable_IActivitySensorReadingChangeReport_Ptr is access all IIterable_IActivitySensorReadingChangeReport;
   type IVectorView_IActivitySensorReadingChangeReport_Interface;
   type IVectorView_IActivitySensorReadingChangeReport is access all IVectorView_IActivitySensorReadingChangeReport_Interface'Class;
   type IVectorView_IActivitySensorReadingChangeReport_Ptr is access all IVectorView_IActivitySensorReadingChangeReport;
   type IAsyncOperation_IBarometer_Interface;
   type IAsyncOperation_IBarometer is access all IAsyncOperation_IBarometer_Interface'Class;
   type IAsyncOperation_IBarometer_Ptr is access all IAsyncOperation_IBarometer;
   type IAsyncOperation_IPedometer_Interface;
   type IAsyncOperation_IPedometer is access all IAsyncOperation_IPedometer_Interface'Class;
   type IAsyncOperation_IPedometer_Ptr is access all IAsyncOperation_IPedometer;
   type IIterator_IPedometerReading_Interface;
   type IIterator_IPedometerReading is access all IIterator_IPedometerReading_Interface'Class;
   type IIterator_IPedometerReading_Ptr is access all IIterator_IPedometerReading;
   type IIterable_IPedometerReading_Interface;
   type IIterable_IPedometerReading is access all IIterable_IPedometerReading_Interface'Class;
   type IIterable_IPedometerReading_Ptr is access all IIterable_IPedometerReading;
   type IVectorView_IPedometerReading_Interface;
   type IVectorView_IPedometerReading is access all IVectorView_IPedometerReading_Interface'Class;
   type IVectorView_IPedometerReading_Ptr is access all IVectorView_IPedometerReading;
   type IIterator_IProximitySensorReading_Interface;
   type IIterator_IProximitySensorReading is access all IIterator_IProximitySensorReading_Interface'Class;
   type IIterator_IProximitySensorReading_Ptr is access all IIterator_IProximitySensorReading;
   type IIterable_IProximitySensorReading_Interface;
   type IIterable_IProximitySensorReading is access all IIterable_IProximitySensorReading_Interface'Class;
   type IIterable_IProximitySensorReading_Ptr is access all IIterable_IProximitySensorReading;
   type IVectorView_IProximitySensorReading_Interface;
   type IVectorView_IProximitySensorReading is access all IVectorView_IProximitySensorReading_Interface'Class;
   type IVectorView_IProximitySensorReading_Ptr is access all IVectorView_IProximitySensorReading;
   
   ------------------------------------------------------------------------
   -- Interfaces
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   
   IID_ISensorDataThreshold : aliased constant Windows.IID := (1423633505, 65099, 19975, (178, 96, 58, 76, 223, 190, 57, 110 ));
   
   type ISensorDataThreshold_Interface is interface and Windows.IInspectable_Interface;
   
   ------------------------------------------------------------------------
   
   IID_ISensorDataThresholdTriggerDetails : aliased constant Windows.IID := (2433151415, 59533, 18609, (188, 144, 97, 156, 123, 52, 147, 145 ));
   
   type ISensorDataThresholdTriggerDetails_Interface is interface and Windows.IInspectable_Interface;
   
   function get_DeviceId
   (
      This       : access ISensorDataThresholdTriggerDetails_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_SensorType
   (
      This       : access ISensorDataThresholdTriggerDetails_Interface
      ; RetVal : access Windows.Devices.Sensors.SensorType
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IAccelerometerDeviceId : aliased constant Windows.IID := (2125227177, 38869, 17517, (171, 90, 145, 125, 249, 185, 106, 44 ));
   
   type IAccelerometerDeviceId_Interface is interface and Windows.IInspectable_Interface;
   
   function get_DeviceId
   (
      This       : access IAccelerometerDeviceId_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IAccelerometerStatics : aliased constant Windows.IID := (2783087476, 23175, 18989, (190, 204, 15, 144, 110, 160, 97, 221 ));
   
   type IAccelerometerStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function GetDefault
   (
      This       : access IAccelerometerStatics_Interface
      ; RetVal : access Windows.Devices.Sensors.IAccelerometer
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IAccelerometerStatics2 : aliased constant Windows.IID := (3301213231, 55403, 18053, (178, 215, 51, 150, 247, 152, 213, 123 ));
   
   type IAccelerometerStatics2_Interface is interface and Windows.IInspectable_Interface;
   
   function GetDefaultWithAccelerometerReadingType
   (
      This       : access IAccelerometerStatics2_Interface
      ; readingType : Windows.Devices.Sensors.AccelerometerReadingType
      ; RetVal : access Windows.Devices.Sensors.IAccelerometer
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IAccelerometerStatics3 : aliased constant Windows.IID := (2648840399, 17757, 19699, (130, 0, 112, 225, 65, 3, 64, 248 ));
   
   type IAccelerometerStatics3_Interface is interface and Windows.IInspectable_Interface;
   
   function FromIdAsync
   (
      This       : access IAccelerometerStatics3_Interface
      ; deviceId : Windows.String
      ; RetVal : access Windows.Devices.Sensors.IAsyncOperation_IAccelerometer -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function GetDeviceSelector
   (
      This       : access IAccelerometerStatics3_Interface
      ; readingType : Windows.Devices.Sensors.AccelerometerReadingType
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IAccelerometer : aliased constant Windows.IID := (3742909768, 10001, 19879, (128, 152, 75, 130, 32, 93, 60, 125 ));
   
   type IAccelerometer_Interface is interface and Windows.IInspectable_Interface;
   
   function GetCurrentReading
   (
      This       : access IAccelerometer_Interface
      ; RetVal : access Windows.Devices.Sensors.IAccelerometerReading
   )
   return Windows.HRESULT is abstract;
   
   function get_MinimumReportInterval
   (
      This       : access IAccelerometer_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function put_ReportInterval
   (
      This       : access IAccelerometer_Interface
      ; value : Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function get_ReportInterval
   (
      This       : access IAccelerometer_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function add_ReadingChanged
   (
      This       : access IAccelerometer_Interface
      ; handler : TypedEventHandler_IAccelerometer_add_ReadingChanged
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_ReadingChanged
   (
      This       : access IAccelerometer_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_Shaken
   (
      This       : access IAccelerometer_Interface
      ; handler : TypedEventHandler_IAccelerometer_add_Shaken
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_Shaken
   (
      This       : access IAccelerometer_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IAccelerometer2 : aliased constant Windows.IID := (3908080366, 18788, 16410, (182, 2, 34, 13, 113, 83, 198, 10 ));
   
   type IAccelerometer2_Interface is interface and Windows.IInspectable_Interface;
   
   function put_ReadingTransform
   (
      This       : access IAccelerometer2_Interface
      ; value : Windows.Graphics.Display.DisplayOrientations
   )
   return Windows.HRESULT is abstract;
   
   function get_ReadingTransform
   (
      This       : access IAccelerometer2_Interface
      ; RetVal : access Windows.Graphics.Display.DisplayOrientations
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IAccelerometer3 : aliased constant Windows.IID := (2279604778, 60800, 18923, (191, 138, 164, 234, 49, 229, 205, 132 ));
   
   type IAccelerometer3_Interface is interface and Windows.IInspectable_Interface;
   
   function put_ReportLatency
   (
      This       : access IAccelerometer3_Interface
      ; value : Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function get_ReportLatency
   (
      This       : access IAccelerometer3_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function get_MaxBatchSize
   (
      This       : access IAccelerometer3_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IAccelerometer4 : aliased constant Windows.IID := (490159183, 17107, 17842, (129, 68, 171, 127, 182, 101, 235, 89 ));
   
   type IAccelerometer4_Interface is interface and Windows.IInspectable_Interface;
   
   function get_ReadingType
   (
      This       : access IAccelerometer4_Interface
      ; RetVal : access Windows.Devices.Sensors.AccelerometerReadingType
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IAccelerometerReading : aliased constant Windows.IID := (3120462539, 54097, 16559, (139, 182, 122, 169, 174, 100, 31, 183 ));
   
   type IAccelerometerReading_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Timestamp
   (
      This       : access IAccelerometerReading_Interface
      ; RetVal : access Windows.Foundation.DateTime
   )
   return Windows.HRESULT is abstract;
   
   function get_AccelerationX
   (
      This       : access IAccelerometerReading_Interface
      ; RetVal : access Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function get_AccelerationY
   (
      This       : access IAccelerometerReading_Interface
      ; RetVal : access Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function get_AccelerationZ
   (
      This       : access IAccelerometerReading_Interface
      ; RetVal : access Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IAccelerometerReading2 : aliased constant Windows.IID := (176573090, 5550, 19008, (190, 85, 219, 88, 215, 222, 115, 137 ));
   
   type IAccelerometerReading2_Interface is interface and Windows.IInspectable_Interface;
   
   function get_PerformanceCount
   (
      This       : access IAccelerometerReading2_Interface
      ; RetVal : access Windows.Foundation.IReference_TimeSpan -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_Properties
   (
      This       : access IAccelerometerReading2_Interface
      ; RetVal : access Windows.Address -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IAccelerometerReadingChangedEventArgs : aliased constant Windows.IID := (9815643, 46764, 18266, (159, 68, 139, 50, 211, 90, 63, 37 ));
   
   type IAccelerometerReadingChangedEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Reading
   (
      This       : access IAccelerometerReadingChangedEventArgs_Interface
      ; RetVal : access Windows.Devices.Sensors.IAccelerometerReading
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IAccelerometerShakenEventArgs : aliased constant Windows.IID := (2516517329, 18984, 20277, (152, 232, 129, 120, 170, 228, 8, 74 ));
   
   type IAccelerometerShakenEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Timestamp
   (
      This       : access IAccelerometerShakenEventArgs_Interface
      ; RetVal : access Windows.Foundation.DateTime
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IInclinometerDeviceId : aliased constant Windows.IID := (32053634, 16895, 17414, (174, 131, 98, 33, 15, 241, 111, 227 ));
   
   type IInclinometerDeviceId_Interface is interface and Windows.IInspectable_Interface;
   
   function get_DeviceId
   (
      This       : access IInclinometerDeviceId_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IInclinometerStatics : aliased constant Windows.IID := (4063151441, 39984, 17722, (139, 73, 60, 62, 235, 51, 203, 97 ));
   
   type IInclinometerStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function GetDefault
   (
      This       : access IInclinometerStatics_Interface
      ; RetVal : access Windows.Devices.Sensors.IInclinometer
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IInclinometerStatics2 : aliased constant Windows.IID := (71276405, 27166, 18844, (134, 224, 99, 140, 26, 134, 75, 0 ));
   
   type IInclinometerStatics2_Interface is interface and Windows.IInspectable_Interface;
   
   function GetDefaultForRelativeReadings
   (
      This       : access IInclinometerStatics2_Interface
      ; RetVal : access Windows.Devices.Sensors.IInclinometer
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IInclinometerStatics3 : aliased constant Windows.IID := (3181003392, 47386, 18473, (147, 146, 171, 192, 182, 189, 242, 180 ));
   
   type IInclinometerStatics3_Interface is interface and Windows.IInspectable_Interface;
   
   function GetDefaultWithSensorReadingType
   (
      This       : access IInclinometerStatics3_Interface
      ; sensorReadingtype : Windows.Devices.Sensors.SensorReadingType
      ; RetVal : access Windows.Devices.Sensors.IInclinometer
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IInclinometerStatics4 : aliased constant Windows.IID := (3904542457, 28293, 19075, (174, 208, 215, 205, 204, 152, 86, 200 ));
   
   type IInclinometerStatics4_Interface is interface and Windows.IInspectable_Interface;
   
   function GetDeviceSelector
   (
      This       : access IInclinometerStatics4_Interface
      ; readingType : Windows.Devices.Sensors.SensorReadingType
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function FromIdAsync
   (
      This       : access IInclinometerStatics4_Interface
      ; deviceId : Windows.String
      ; RetVal : access Windows.Devices.Sensors.IAsyncOperation_IInclinometer -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IInclinometer : aliased constant Windows.IID := (642304623, 8838, 16495, (145, 97, 240, 196, 189, 128, 110, 191 ));
   
   type IInclinometer_Interface is interface and Windows.IInspectable_Interface;
   
   function GetCurrentReading
   (
      This       : access IInclinometer_Interface
      ; RetVal : access Windows.Devices.Sensors.IInclinometerReading
   )
   return Windows.HRESULT is abstract;
   
   function get_MinimumReportInterval
   (
      This       : access IInclinometer_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function put_ReportInterval
   (
      This       : access IInclinometer_Interface
      ; value : Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function get_ReportInterval
   (
      This       : access IInclinometer_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function add_ReadingChanged
   (
      This       : access IInclinometer_Interface
      ; handler : TypedEventHandler_IInclinometer_add_ReadingChanged
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_ReadingChanged
   (
      This       : access IInclinometer_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IInclinometer2 : aliased constant Windows.IID := (43987859, 10418, 17912, (187, 22, 97, 232, 106, 127, 174, 110 ));
   
   type IInclinometer2_Interface is interface and Windows.IInspectable_Interface;
   
   function put_ReadingTransform
   (
      This       : access IInclinometer2_Interface
      ; value : Windows.Graphics.Display.DisplayOrientations
   )
   return Windows.HRESULT is abstract;
   
   function get_ReadingTransform
   (
      This       : access IInclinometer2_Interface
      ; RetVal : access Windows.Graphics.Display.DisplayOrientations
   )
   return Windows.HRESULT is abstract;
   
   function get_ReadingType
   (
      This       : access IInclinometer2_Interface
      ; RetVal : access Windows.Devices.Sensors.SensorReadingType
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IInclinometer3 : aliased constant Windows.IID := (973688836, 55141, 17284, (163, 215, 2, 131, 243, 171, 230, 174 ));
   
   type IInclinometer3_Interface is interface and Windows.IInspectable_Interface;
   
   function put_ReportLatency
   (
      This       : access IInclinometer3_Interface
      ; value : Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function get_ReportLatency
   (
      This       : access IInclinometer3_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function get_MaxBatchSize
   (
      This       : access IInclinometer3_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IInclinometerReading : aliased constant Windows.IID := (2672095317, 46838, 18815, (177, 39, 26, 119, 94, 80, 20, 88 ));
   
   type IInclinometerReading_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Timestamp
   (
      This       : access IInclinometerReading_Interface
      ; RetVal : access Windows.Foundation.DateTime
   )
   return Windows.HRESULT is abstract;
   
   function get_PitchDegrees
   (
      This       : access IInclinometerReading_Interface
      ; RetVal : access Windows.Single
   )
   return Windows.HRESULT is abstract;
   
   function get_RollDegrees
   (
      This       : access IInclinometerReading_Interface
      ; RetVal : access Windows.Single
   )
   return Windows.HRESULT is abstract;
   
   function get_YawDegrees
   (
      This       : access IInclinometerReading_Interface
      ; RetVal : access Windows.Single
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IInclinometerReading2 : aliased constant Windows.IID := (1326860161, 59659, 18008, (137, 21, 1, 3, 224, 138, 128, 90 ));
   
   type IInclinometerReading2_Interface is interface and Windows.IInspectable_Interface;
   
   function get_PerformanceCount
   (
      This       : access IInclinometerReading2_Interface
      ; RetVal : access Windows.Foundation.IReference_TimeSpan -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_Properties
   (
      This       : access IInclinometerReading2_Interface
      ; RetVal : access Windows.Address -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IInclinometerReadingYawAccuracy : aliased constant Windows.IID := (3025397888, 8163, 18822, (162, 87, 230, 236, 226, 114, 57, 73 ));
   
   type IInclinometerReadingYawAccuracy_Interface is interface and Windows.IInspectable_Interface;
   
   function get_YawAccuracy
   (
      This       : access IInclinometerReadingYawAccuracy_Interface
      ; RetVal : access Windows.Devices.Sensors.MagnetometerAccuracy
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IInclinometerReadingChangedEventArgs : aliased constant Windows.IID := (1256791489, 59371, 18744, (133, 17, 174, 13, 107, 68, 4, 56 ));
   
   type IInclinometerReadingChangedEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Reading
   (
      This       : access IInclinometerReadingChangedEventArgs_Interface
      ; RetVal : access Windows.Devices.Sensors.IInclinometerReading
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IGyrometerDeviceId : aliased constant Windows.IID := (518383992, 35234, 17013, (158, 149, 113, 38, 244, 112, 135, 96 ));
   
   type IGyrometerDeviceId_Interface is interface and Windows.IInspectable_Interface;
   
   function get_DeviceId
   (
      This       : access IGyrometerDeviceId_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IGyrometerStatics : aliased constant Windows.IID := (2209802185, 58525, 19257, (134, 230, 205, 85, 75, 228, 197, 193 ));
   
   type IGyrometerStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function GetDefault
   (
      This       : access IGyrometerStatics_Interface
      ; RetVal : access Windows.Devices.Sensors.IGyrometer
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IGyrometerStatics2 : aliased constant Windows.IID := (4018403233, 55040, 16900, (150, 19, 121, 198, 177, 97, 223, 78 ));
   
   type IGyrometerStatics2_Interface is interface and Windows.IInspectable_Interface;
   
   function GetDeviceSelector
   (
      This       : access IGyrometerStatics2_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function FromIdAsync
   (
      This       : access IGyrometerStatics2_Interface
      ; deviceId : Windows.String
      ; RetVal : access Windows.Devices.Sensors.IAsyncOperation_IGyrometer -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IGyrometer : aliased constant Windows.IID := (4256803268, 33969, 19618, (151, 99, 155, 88, 149, 6, 199, 12 ));
   
   type IGyrometer_Interface is interface and Windows.IInspectable_Interface;
   
   function GetCurrentReading
   (
      This       : access IGyrometer_Interface
      ; RetVal : access Windows.Devices.Sensors.IGyrometerReading
   )
   return Windows.HRESULT is abstract;
   
   function get_MinimumReportInterval
   (
      This       : access IGyrometer_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function put_ReportInterval
   (
      This       : access IGyrometer_Interface
      ; value : Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function get_ReportInterval
   (
      This       : access IGyrometer_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function add_ReadingChanged
   (
      This       : access IGyrometer_Interface
      ; handler : TypedEventHandler_IGyrometer_add_ReadingChanged
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_ReadingChanged
   (
      This       : access IGyrometer_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IGyrometer2 : aliased constant Windows.IID := (1675568195, 36072, 16835, (172, 68, 134, 152, 129, 11, 85, 127 ));
   
   type IGyrometer2_Interface is interface and Windows.IInspectable_Interface;
   
   function put_ReadingTransform
   (
      This       : access IGyrometer2_Interface
      ; value : Windows.Graphics.Display.DisplayOrientations
   )
   return Windows.HRESULT is abstract;
   
   function get_ReadingTransform
   (
      This       : access IGyrometer2_Interface
      ; RetVal : access Windows.Graphics.Display.DisplayOrientations
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IGyrometer3 : aliased constant Windows.IID := (1567590613, 36796, 17540, (145, 75, 82, 138, 223, 217, 71, 177 ));
   
   type IGyrometer3_Interface is interface and Windows.IInspectable_Interface;
   
   function put_ReportLatency
   (
      This       : access IGyrometer3_Interface
      ; value : Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function get_ReportLatency
   (
      This       : access IGyrometer3_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function get_MaxBatchSize
   (
      This       : access IGyrometer3_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IGyrometerReading : aliased constant Windows.IID := (3017203292, 7908, 17775, (157, 231, 226, 73, 59, 92, 142, 3 ));
   
   type IGyrometerReading_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Timestamp
   (
      This       : access IGyrometerReading_Interface
      ; RetVal : access Windows.Foundation.DateTime
   )
   return Windows.HRESULT is abstract;
   
   function get_AngularVelocityX
   (
      This       : access IGyrometerReading_Interface
      ; RetVal : access Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function get_AngularVelocityY
   (
      This       : access IGyrometerReading_Interface
      ; RetVal : access Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function get_AngularVelocityZ
   (
      This       : access IGyrometerReading_Interface
      ; RetVal : access Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IGyrometerReading2 : aliased constant Windows.IID := (380625212, 11145, 17595, (130, 43, 209, 225, 85, 111, 240, 155 ));
   
   type IGyrometerReading2_Interface is interface and Windows.IInspectable_Interface;
   
   function get_PerformanceCount
   (
      This       : access IGyrometerReading2_Interface
      ; RetVal : access Windows.Foundation.IReference_TimeSpan -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_Properties
   (
      This       : access IGyrometerReading2_Interface
      ; RetVal : access Windows.Address -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IGyrometerReadingChangedEventArgs : aliased constant Windows.IID := (266279061, 28574, 17102, (141, 88, 56, 140, 10, 184, 53, 109 ));
   
   type IGyrometerReadingChangedEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Reading
   (
      This       : access IGyrometerReadingChangedEventArgs_Interface
      ; RetVal : access Windows.Devices.Sensors.IGyrometerReading
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ICompassDeviceId : aliased constant Windows.IID := (3514944041, 45189, 19229, (135, 10, 79, 245, 123, 167, 79, 212 ));
   
   type ICompassDeviceId_Interface is interface and Windows.IInspectable_Interface;
   
   function get_DeviceId
   (
      This       : access ICompassDeviceId_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ICompassStatics : aliased constant Windows.IID := (2596050911, 22252, 19493, (181, 77, 64, 166, 139, 181, 178, 105 ));
   
   type ICompassStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function GetDefault
   (
      This       : access ICompassStatics_Interface
      ; RetVal : access Windows.Devices.Sensors.ICompass
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ICompassStatics2 : aliased constant Windows.IID := (181276333, 15274, 18832, (156, 228, 190, 9, 19, 117, 78, 210 ));
   
   type ICompassStatics2_Interface is interface and Windows.IInspectable_Interface;
   
   function GetDeviceSelector
   (
      This       : access ICompassStatics2_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function FromIdAsync
   (
      This       : access ICompassStatics2_Interface
      ; deviceId : Windows.String
      ; RetVal : access Windows.Devices.Sensors.IAsyncOperation_ICompass -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ICompass : aliased constant Windows.IID := (691010196, 6981, 16444, (186, 6, 177, 6, 219, 166, 154, 100 ));
   
   type ICompass_Interface is interface and Windows.IInspectable_Interface;
   
   function GetCurrentReading
   (
      This       : access ICompass_Interface
      ; RetVal : access Windows.Devices.Sensors.ICompassReading
   )
   return Windows.HRESULT is abstract;
   
   function get_MinimumReportInterval
   (
      This       : access ICompass_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function put_ReportInterval
   (
      This       : access ICompass_Interface
      ; value : Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function get_ReportInterval
   (
      This       : access ICompass_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function add_ReadingChanged
   (
      This       : access ICompass_Interface
      ; handler : TypedEventHandler_ICompass_add_ReadingChanged
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_ReadingChanged
   (
      This       : access ICompass_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ICompass2 : aliased constant Windows.IID := (921857289, 51159, 17231, (180, 97, 151, 157, 223, 194, 50, 47 ));
   
   type ICompass2_Interface is interface and Windows.IInspectable_Interface;
   
   function put_ReadingTransform
   (
      This       : access ICompass2_Interface
      ; value : Windows.Graphics.Display.DisplayOrientations
   )
   return Windows.HRESULT is abstract;
   
   function get_ReadingTransform
   (
      This       : access ICompass2_Interface
      ; RetVal : access Windows.Graphics.Display.DisplayOrientations
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ICompass3 : aliased constant Windows.IID := (2753855515, 50666, 19781, (160, 236, 75, 121, 31, 4, 26, 137 ));
   
   type ICompass3_Interface is interface and Windows.IInspectable_Interface;
   
   function put_ReportLatency
   (
      This       : access ICompass3_Interface
      ; value : Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function get_ReportLatency
   (
      This       : access ICompass3_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function get_MaxBatchSize
   (
      This       : access ICompass3_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ICompassReading : aliased constant Windows.IID := (2190545192, 20797, 19913, (183, 129, 94, 237, 251, 240, 45, 12 ));
   
   type ICompassReading_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Timestamp
   (
      This       : access ICompassReading_Interface
      ; RetVal : access Windows.Foundation.DateTime
   )
   return Windows.HRESULT is abstract;
   
   function get_HeadingMagneticNorth
   (
      This       : access ICompassReading_Interface
      ; RetVal : access Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function get_HeadingTrueNorth
   (
      This       : access ICompassReading_Interface
      ; RetVal : access Windows.Foundation.IReference_Double -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ICompassReading2 : aliased constant Windows.IID := (2973394462, 20923, 18962, (190, 221, 173, 71, 255, 135, 210, 232 ));
   
   type ICompassReading2_Interface is interface and Windows.IInspectable_Interface;
   
   function get_PerformanceCount
   (
      This       : access ICompassReading2_Interface
      ; RetVal : access Windows.Foundation.IReference_TimeSpan -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_Properties
   (
      This       : access ICompassReading2_Interface
      ; RetVal : access Windows.Address -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ICompassReadingHeadingAccuracy : aliased constant Windows.IID := (3881907534, 35089, 16631, (158, 22, 110, 204, 125, 174, 197, 222 ));
   
   type ICompassReadingHeadingAccuracy_Interface is interface and Windows.IInspectable_Interface;
   
   function get_HeadingAccuracy
   (
      This       : access ICompassReadingHeadingAccuracy_Interface
      ; RetVal : access Windows.Devices.Sensors.MagnetometerAccuracy
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ICompassReadingChangedEventArgs : aliased constant Windows.IID := (2400537008, 59580, 19582, (176, 9, 78, 65, 223, 19, 112, 114 ));
   
   type ICompassReadingChangedEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Reading
   (
      This       : access ICompassReadingChangedEventArgs_Interface
      ; RetVal : access Windows.Devices.Sensors.ICompassReading
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ILightSensorDeviceId : aliased constant Windows.IID := (2146322936, 2811, 20305, (135, 240, 108, 38, 55, 92, 233, 79 ));
   
   type ILightSensorDeviceId_Interface is interface and Windows.IInspectable_Interface;
   
   function get_DeviceId
   (
      This       : access ILightSensorDeviceId_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ILightSensorStatics : aliased constant Windows.IID := (1172016260, 50088, 18206, (154, 83, 100, 87, 250, 216, 124, 14 ));
   
   type ILightSensorStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function GetDefault
   (
      This       : access ILightSensorStatics_Interface
      ; RetVal : access Windows.Devices.Sensors.ILightSensor
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ILightSensorStatics2 : aliased constant Windows.IID := (247506512, 56774, 16555, (172, 227, 236, 51, 89, 212, 44, 81 ));
   
   type ILightSensorStatics2_Interface is interface and Windows.IInspectable_Interface;
   
   function GetDeviceSelector
   (
      This       : access ILightSensorStatics2_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function FromIdAsync
   (
      This       : access ILightSensorStatics2_Interface
      ; deviceId : Windows.String
      ; RetVal : access Windows.Devices.Sensors.IAsyncOperation_ILightSensor -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ILightSensor : aliased constant Windows.IID := (4165732120, 3156, 18350, (146, 46, 120, 159, 87, 251, 3, 160 ));
   
   type ILightSensor_Interface is interface and Windows.IInspectable_Interface;
   
   function GetCurrentReading
   (
      This       : access ILightSensor_Interface
      ; RetVal : access Windows.Devices.Sensors.ILightSensorReading
   )
   return Windows.HRESULT is abstract;
   
   function get_MinimumReportInterval
   (
      This       : access ILightSensor_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function put_ReportInterval
   (
      This       : access ILightSensor_Interface
      ; value : Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function get_ReportInterval
   (
      This       : access ILightSensor_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function add_ReadingChanged
   (
      This       : access ILightSensor_Interface
      ; handler : TypedEventHandler_ILightSensor_add_ReadingChanged
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_ReadingChanged
   (
      This       : access ILightSensor_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ILightSensor2 : aliased constant Windows.IID := (1214981352, 43340, 16528, (143, 72, 9, 247, 130, 169, 247, 213 ));
   
   type ILightSensor2_Interface is interface and Windows.IInspectable_Interface;
   
   function put_ReportLatency
   (
      This       : access ILightSensor2_Interface
      ; value : Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function get_ReportLatency
   (
      This       : access ILightSensor2_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function get_MaxBatchSize
   (
      This       : access ILightSensor2_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ILightSensorReading : aliased constant Windows.IID := (4292829952, 8828, 19755, (179, 2, 252, 1, 66, 72, 92, 104 ));
   
   type ILightSensorReading_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Timestamp
   (
      This       : access ILightSensorReading_Interface
      ; RetVal : access Windows.Foundation.DateTime
   )
   return Windows.HRESULT is abstract;
   
   function get_IlluminanceInLux
   (
      This       : access ILightSensorReading_Interface
      ; RetVal : access Windows.Single
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ILightSensorReading2 : aliased constant Windows.IID := (3075547525, 17571, 17609, (129, 144, 158, 246, 222, 10, 138, 116 ));
   
   type ILightSensorReading2_Interface is interface and Windows.IInspectable_Interface;
   
   function get_PerformanceCount
   (
      This       : access ILightSensorReading2_Interface
      ; RetVal : access Windows.Foundation.IReference_TimeSpan -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_Properties
   (
      This       : access ILightSensorReading2_Interface
      ; RetVal : access Windows.Address -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ILightSensorReadingChangedEventArgs : aliased constant Windows.IID := (2745365711, 9611, 16908, (184, 171, 142, 221, 96, 30, 207, 80 ));
   
   type ILightSensorReadingChangedEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Reading
   (
      This       : access ILightSensorReadingChangedEventArgs_Interface
      ; RetVal : access Windows.Devices.Sensors.ILightSensorReading
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ISensorRotationMatrix : aliased constant Windows.IID := (171792999, 8948, 17298, (149, 56, 101, 208, 189, 6, 74, 166 ));
   
   type ISensorRotationMatrix_Interface is interface and Windows.IInspectable_Interface;
   
   function get_M11
   (
      This       : access ISensorRotationMatrix_Interface
      ; RetVal : access Windows.Single
   )
   return Windows.HRESULT is abstract;
   
   function get_M12
   (
      This       : access ISensorRotationMatrix_Interface
      ; RetVal : access Windows.Single
   )
   return Windows.HRESULT is abstract;
   
   function get_M13
   (
      This       : access ISensorRotationMatrix_Interface
      ; RetVal : access Windows.Single
   )
   return Windows.HRESULT is abstract;
   
   function get_M21
   (
      This       : access ISensorRotationMatrix_Interface
      ; RetVal : access Windows.Single
   )
   return Windows.HRESULT is abstract;
   
   function get_M22
   (
      This       : access ISensorRotationMatrix_Interface
      ; RetVal : access Windows.Single
   )
   return Windows.HRESULT is abstract;
   
   function get_M23
   (
      This       : access ISensorRotationMatrix_Interface
      ; RetVal : access Windows.Single
   )
   return Windows.HRESULT is abstract;
   
   function get_M31
   (
      This       : access ISensorRotationMatrix_Interface
      ; RetVal : access Windows.Single
   )
   return Windows.HRESULT is abstract;
   
   function get_M32
   (
      This       : access ISensorRotationMatrix_Interface
      ; RetVal : access Windows.Single
   )
   return Windows.HRESULT is abstract;
   
   function get_M33
   (
      This       : access ISensorRotationMatrix_Interface
      ; RetVal : access Windows.Single
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ISensorQuaternion : aliased constant Windows.IID := (3385182247, 50972, 18151, (157, 163, 54, 161, 147, 178, 50, 188 ));
   
   type ISensorQuaternion_Interface is interface and Windows.IInspectable_Interface;
   
   function get_W
   (
      This       : access ISensorQuaternion_Interface
      ; RetVal : access Windows.Single
   )
   return Windows.HRESULT is abstract;
   
   function get_X
   (
      This       : access ISensorQuaternion_Interface
      ; RetVal : access Windows.Single
   )
   return Windows.HRESULT is abstract;
   
   function get_Y
   (
      This       : access ISensorQuaternion_Interface
      ; RetVal : access Windows.Single
   )
   return Windows.HRESULT is abstract;
   
   function get_Z
   (
      This       : access ISensorQuaternion_Interface
      ; RetVal : access Windows.Single
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IOrientationSensorDeviceId : aliased constant Windows.IID := (1516877384, 19497, 18924, (178, 143, 234, 29, 17, 123, 102, 240 ));
   
   type IOrientationSensorDeviceId_Interface is interface and Windows.IInspectable_Interface;
   
   function get_DeviceId
   (
      This       : access IOrientationSensorDeviceId_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IOrientationSensorStatics : aliased constant Windows.IID := (284133138, 64332, 17034, (137, 139, 39, 101, 228, 9, 230, 105 ));
   
   type IOrientationSensorStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function GetDefault
   (
      This       : access IOrientationSensorStatics_Interface
      ; RetVal : access Windows.Devices.Sensors.IOrientationSensor
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IOrientationSensorStatics2 : aliased constant Windows.IID := (1507462411, 54282, 19569, (146, 118, 138, 39, 42, 10, 102, 25 ));
   
   type IOrientationSensorStatics2_Interface is interface and Windows.IInspectable_Interface;
   
   function GetDefaultForRelativeReadings
   (
      This       : access IOrientationSensorStatics2_Interface
      ; RetVal : access Windows.Devices.Sensors.IOrientationSensor
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IOrientationSensorStatics3 : aliased constant Windows.IID := (3626821920, 10103, 16639, (159, 89, 214, 84, 176, 133, 241, 47 ));
   
   type IOrientationSensorStatics3_Interface is interface and Windows.IInspectable_Interface;
   
   function GetDefaultWithSensorReadingType
   (
      This       : access IOrientationSensorStatics3_Interface
      ; sensorReadingtype : Windows.Devices.Sensors.SensorReadingType
      ; RetVal : access Windows.Devices.Sensors.IOrientationSensor
   )
   return Windows.HRESULT is abstract;
   
   function GetDefaultWithSensorReadingTypeAndSensorOptimizationGoal
   (
      This       : access IOrientationSensorStatics3_Interface
      ; sensorReadingType : Windows.Devices.Sensors.SensorReadingType
      ; optimizationGoal : Windows.Devices.Sensors.SensorOptimizationGoal
      ; RetVal : access Windows.Devices.Sensors.IOrientationSensor
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IOrientationSensorStatics4 : aliased constant Windows.IID := (2793401173, 11397, 19240, (160, 254, 88, 196, 178, 4, 149, 245 ));
   
   type IOrientationSensorStatics4_Interface is interface and Windows.IInspectable_Interface;
   
   function GetDeviceSelector
   (
      This       : access IOrientationSensorStatics4_Interface
      ; readingType : Windows.Devices.Sensors.SensorReadingType
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function GetDeviceSelectorWithSensorReadingTypeAndSensorOptimizationGoal
   (
      This       : access IOrientationSensorStatics4_Interface
      ; readingType : Windows.Devices.Sensors.SensorReadingType
      ; optimizationGoal : Windows.Devices.Sensors.SensorOptimizationGoal
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function FromIdAsync
   (
      This       : access IOrientationSensorStatics4_Interface
      ; deviceId : Windows.String
      ; RetVal : access Windows.Devices.Sensors.IAsyncOperation_IOrientationSensor -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IOrientationSensor : aliased constant Windows.IID := (1580549685, 53099, 19555, (171, 216, 16, 37, 43, 11, 246, 236 ));
   
   type IOrientationSensor_Interface is interface and Windows.IInspectable_Interface;
   
   function GetCurrentReading
   (
      This       : access IOrientationSensor_Interface
      ; RetVal : access Windows.Devices.Sensors.IOrientationSensorReading
   )
   return Windows.HRESULT is abstract;
   
   function get_MinimumReportInterval
   (
      This       : access IOrientationSensor_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function put_ReportInterval
   (
      This       : access IOrientationSensor_Interface
      ; value : Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function get_ReportInterval
   (
      This       : access IOrientationSensor_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function add_ReadingChanged
   (
      This       : access IOrientationSensor_Interface
      ; handler : TypedEventHandler_IOrientationSensor_add_ReadingChanged
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_ReadingChanged
   (
      This       : access IOrientationSensor_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IOrientationSensor2 : aliased constant Windows.IID := (227691769, 12063, 18889, (128, 66, 74, 24, 19, 214, 119, 96 ));
   
   type IOrientationSensor2_Interface is interface and Windows.IInspectable_Interface;
   
   function put_ReadingTransform
   (
      This       : access IOrientationSensor2_Interface
      ; value : Windows.Graphics.Display.DisplayOrientations
   )
   return Windows.HRESULT is abstract;
   
   function get_ReadingTransform
   (
      This       : access IOrientationSensor2_Interface
      ; RetVal : access Windows.Graphics.Display.DisplayOrientations
   )
   return Windows.HRESULT is abstract;
   
   function get_ReadingType
   (
      This       : access IOrientationSensor2_Interface
      ; RetVal : access Windows.Devices.Sensors.SensorReadingType
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IOrientationSensor3 : aliased constant Windows.IID := (751720333, 25707, 18629, (183, 238, 68, 253, 196, 198, 170, 253 ));
   
   type IOrientationSensor3_Interface is interface and Windows.IInspectable_Interface;
   
   function put_ReportLatency
   (
      This       : access IOrientationSensor3_Interface
      ; value : Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function get_ReportLatency
   (
      This       : access IOrientationSensor3_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function get_MaxBatchSize
   (
      This       : access IOrientationSensor3_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IOrientationSensorReading : aliased constant Windows.IID := (1196870035, 26005, 18583, (188, 198, 213, 55, 238, 117, 117, 100 ));
   
   type IOrientationSensorReading_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Timestamp
   (
      This       : access IOrientationSensorReading_Interface
      ; RetVal : access Windows.Foundation.DateTime
   )
   return Windows.HRESULT is abstract;
   
   function get_RotationMatrix
   (
      This       : access IOrientationSensorReading_Interface
      ; RetVal : access Windows.Devices.Sensors.ISensorRotationMatrix
   )
   return Windows.HRESULT is abstract;
   
   function get_Quaternion
   (
      This       : access IOrientationSensorReading_Interface
      ; RetVal : access Windows.Devices.Sensors.ISensorQuaternion
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IOrientationSensorReading2 : aliased constant Windows.IID := (5729887, 18936, 19461, (158, 7, 36, 250, 199, 148, 8, 195 ));
   
   type IOrientationSensorReading2_Interface is interface and Windows.IInspectable_Interface;
   
   function get_PerformanceCount
   (
      This       : access IOrientationSensorReading2_Interface
      ; RetVal : access Windows.Foundation.IReference_TimeSpan -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_Properties
   (
      This       : access IOrientationSensorReading2_Interface
      ; RetVal : access Windows.Address -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IOrientationSensorReadingYawAccuracy : aliased constant Windows.IID := (3517749284, 16218, 18850, (188, 123, 17, 128, 188, 56, 205, 43 ));
   
   type IOrientationSensorReadingYawAccuracy_Interface is interface and Windows.IInspectable_Interface;
   
   function get_YawAccuracy
   (
      This       : access IOrientationSensorReadingYawAccuracy_Interface
      ; RetVal : access Windows.Devices.Sensors.MagnetometerAccuracy
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IOrientationSensorReadingChangedEventArgs : aliased constant Windows.IID := (19665286, 50106, 18108, (174, 101, 122, 152, 153, 108, 191, 184 ));
   
   type IOrientationSensorReadingChangedEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Reading
   (
      This       : access IOrientationSensorReadingChangedEventArgs_Interface
      ; RetVal : access Windows.Devices.Sensors.IOrientationSensorReading
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ISimpleOrientationSensorDeviceId : aliased constant Windows.IID := (4223666891, 15222, 16886, (128, 145, 48, 239, 230, 70, 211, 207 ));
   
   type ISimpleOrientationSensorDeviceId_Interface is interface and Windows.IInspectable_Interface;
   
   function get_DeviceId
   (
      This       : access ISimpleOrientationSensorDeviceId_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ISimpleOrientationSensorStatics : aliased constant Windows.IID := (1928136303, 28842, 16582, (155, 27, 52, 51, 247, 69, 155, 78 ));
   
   type ISimpleOrientationSensorStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function GetDefault
   (
      This       : access ISimpleOrientationSensorStatics_Interface
      ; RetVal : access Windows.Devices.Sensors.ISimpleOrientationSensor
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ISimpleOrientationSensor : aliased constant Windows.IID := (1609906262, 8522, 19950, (163, 249, 97, 111, 26, 176, 111, 253 ));
   
   type ISimpleOrientationSensor_Interface is interface and Windows.IInspectable_Interface;
   
   function GetCurrentOrientation
   (
      This       : access ISimpleOrientationSensor_Interface
      ; RetVal : access Windows.Devices.Sensors.SimpleOrientation
   )
   return Windows.HRESULT is abstract;
   
   function add_OrientationChanged
   (
      This       : access ISimpleOrientationSensor_Interface
      ; handler : TypedEventHandler_ISimpleOrientationSensor_add_OrientationChanged
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_OrientationChanged
   (
      This       : access ISimpleOrientationSensor_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ISimpleOrientationSensor2 : aliased constant Windows.IID := (2725750680, 34928, 17726, (139, 214, 184, 245, 216, 215, 148, 27 ));
   
   type ISimpleOrientationSensor2_Interface is interface and Windows.IInspectable_Interface;
   
   function put_ReadingTransform
   (
      This       : access ISimpleOrientationSensor2_Interface
      ; value : Windows.Graphics.Display.DisplayOrientations
   )
   return Windows.HRESULT is abstract;
   
   function get_ReadingTransform
   (
      This       : access ISimpleOrientationSensor2_Interface
      ; RetVal : access Windows.Graphics.Display.DisplayOrientations
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ISimpleOrientationSensorOrientationChangedEventArgs : aliased constant Windows.IID := (3168126560, 9172, 19276, (162, 46, 186, 129, 173, 224, 198, 1 ));
   
   type ISimpleOrientationSensorOrientationChangedEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Timestamp
   (
      This       : access ISimpleOrientationSensorOrientationChangedEventArgs_Interface
      ; RetVal : access Windows.Foundation.DateTime
   )
   return Windows.HRESULT is abstract;
   
   function get_Orientation
   (
      This       : access ISimpleOrientationSensorOrientationChangedEventArgs_Interface
      ; RetVal : access Windows.Devices.Sensors.SimpleOrientation
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IMagnetometerDeviceId : aliased constant Windows.IID := (1488230594, 32331, 16460, (159, 197, 93, 232, 180, 14, 186, 227 ));
   
   type IMagnetometerDeviceId_Interface is interface and Windows.IInspectable_Interface;
   
   function get_DeviceId
   (
      This       : access IMagnetometerDeviceId_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IMagnetometerStatics : aliased constant Windows.IID := (2235327692, 1688, 19930, (166, 223, 156, 185, 204, 74, 180, 10 ));
   
   type IMagnetometerStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function GetDefault
   (
      This       : access IMagnetometerStatics_Interface
      ; RetVal : access Windows.Devices.Sensors.IMagnetometer
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IMagnetometerStatics2 : aliased constant Windows.IID := (738728432, 65478, 20361, (160, 111, 24, 250, 16, 121, 41, 51 ));
   
   type IMagnetometerStatics2_Interface is interface and Windows.IInspectable_Interface;
   
   function GetDeviceSelector
   (
      This       : access IMagnetometerStatics2_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function FromIdAsync
   (
      This       : access IMagnetometerStatics2_Interface
      ; deviceId : Windows.String
      ; RetVal : access Windows.Devices.Sensors.IAsyncOperation_IMagnetometer -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IMagnetometer : aliased constant Windows.IID := (1213162094, 54217, 16657, (179, 246, 44, 241, 250, 164, 24, 213 ));
   
   type IMagnetometer_Interface is interface and Windows.IInspectable_Interface;
   
   function GetCurrentReading
   (
      This       : access IMagnetometer_Interface
      ; RetVal : access Windows.Devices.Sensors.IMagnetometerReading
   )
   return Windows.HRESULT is abstract;
   
   function get_MinimumReportInterval
   (
      This       : access IMagnetometer_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function put_ReportInterval
   (
      This       : access IMagnetometer_Interface
      ; value : Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function get_ReportInterval
   (
      This       : access IMagnetometer_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function add_ReadingChanged
   (
      This       : access IMagnetometer_Interface
      ; handler : TypedEventHandler_IMagnetometer_add_ReadingChanged
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_ReadingChanged
   (
      This       : access IMagnetometer_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IMagnetometer2 : aliased constant Windows.IID := (3026545797, 9974, 17483, (169, 226, 162, 63, 150, 108, 211, 104 ));
   
   type IMagnetometer2_Interface is interface and Windows.IInspectable_Interface;
   
   function put_ReadingTransform
   (
      This       : access IMagnetometer2_Interface
      ; value : Windows.Graphics.Display.DisplayOrientations
   )
   return Windows.HRESULT is abstract;
   
   function get_ReadingTransform
   (
      This       : access IMagnetometer2_Interface
      ; RetVal : access Windows.Graphics.Display.DisplayOrientations
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IMagnetometer3 : aliased constant Windows.IID := (3197361020, 42533, 18671, (172, 247, 250, 193, 4, 131, 38, 113 ));
   
   type IMagnetometer3_Interface is interface and Windows.IInspectable_Interface;
   
   function put_ReportLatency
   (
      This       : access IMagnetometer3_Interface
      ; value : Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function get_ReportLatency
   (
      This       : access IMagnetometer3_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function get_MaxBatchSize
   (
      This       : access IMagnetometer3_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IMagnetometerReading : aliased constant Windows.IID := (204260365, 60413, 20060, (187, 17, 175, 194, 155, 60, 174, 97 ));
   
   type IMagnetometerReading_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Timestamp
   (
      This       : access IMagnetometerReading_Interface
      ; RetVal : access Windows.Foundation.DateTime
   )
   return Windows.HRESULT is abstract;
   
   function get_MagneticFieldX
   (
      This       : access IMagnetometerReading_Interface
      ; RetVal : access Windows.Single
   )
   return Windows.HRESULT is abstract;
   
   function get_MagneticFieldY
   (
      This       : access IMagnetometerReading_Interface
      ; RetVal : access Windows.Single
   )
   return Windows.HRESULT is abstract;
   
   function get_MagneticFieldZ
   (
      This       : access IMagnetometerReading_Interface
      ; RetVal : access Windows.Single
   )
   return Windows.HRESULT is abstract;
   
   function get_DirectionalAccuracy
   (
      This       : access IMagnetometerReading_Interface
      ; RetVal : access Windows.Devices.Sensors.MagnetometerAccuracy
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IMagnetometerReading2 : aliased constant Windows.IID := (3569966177, 25049, 16459, (163, 40, 6, 111, 23, 122, 20, 9 ));
   
   type IMagnetometerReading2_Interface is interface and Windows.IInspectable_Interface;
   
   function get_PerformanceCount
   (
      This       : access IMagnetometerReading2_Interface
      ; RetVal : access Windows.Foundation.IReference_TimeSpan -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_Properties
   (
      This       : access IMagnetometerReading2_Interface
      ; RetVal : access Windows.Address -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IMagnetometerReadingChangedEventArgs : aliased constant Windows.IID := (401270898, 11961, 20199, (138, 208, 49, 39, 83, 125, 148, 155 ));
   
   type IMagnetometerReadingChangedEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Reading
   (
      This       : access IMagnetometerReadingChangedEventArgs_Interface
      ; RetVal : access Windows.Devices.Sensors.IMagnetometerReading
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IActivitySensorStatics : aliased constant Windows.IID := (2803764893, 61067, 17873, (178, 91, 8, 204, 13, 249, 42, 182 ));
   
   type IActivitySensorStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function GetDefaultAsync
   (
      This       : access IActivitySensorStatics_Interface
      ; RetVal : access Windows.Devices.Sensors.IAsyncOperation_IActivitySensor -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function GetDeviceSelector
   (
      This       : access IActivitySensorStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function FromIdAsync
   (
      This       : access IActivitySensorStatics_Interface
      ; deviceId : Windows.String
      ; RetVal : access Windows.Devices.Sensors.IAsyncOperation_IActivitySensor -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function GetSystemHistoryAsync
   (
      This       : access IActivitySensorStatics_Interface
      ; fromTime : Windows.Foundation.DateTime
      ; RetVal : access Windows.Address -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function GetSystemHistoryWithDurationAsync
   (
      This       : access IActivitySensorStatics_Interface
      ; fromTime : Windows.Foundation.DateTime
      ; duration : Windows.Foundation.TimeSpan
      ; RetVal : access Windows.Address -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IActivitySensor : aliased constant Windows.IID := (3447350028, 64351, 18667, (176, 155, 162, 112, 141, 28, 97, 239 ));
   
   type IActivitySensor_Interface is interface and Windows.IInspectable_Interface;
   
   function GetCurrentReadingAsync
   (
      This       : access IActivitySensor_Interface
      ; RetVal : access Windows.Devices.Sensors.IAsyncOperation_IActivitySensorReading -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_SubscribedActivities
   (
      This       : access IActivitySensor_Interface
      ; RetVal : access Windows.Devices.Sensors.IVector_ActivityType -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_PowerInMilliwatts
   (
      This       : access IActivitySensor_Interface
      ; RetVal : access Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function get_DeviceId
   (
      This       : access IActivitySensor_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_SupportedActivities
   (
      This       : access IActivitySensor_Interface
      ; RetVal : access Windows.Devices.Sensors.IVectorView_ActivityType -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_MinimumReportInterval
   (
      This       : access IActivitySensor_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function add_ReadingChanged
   (
      This       : access IActivitySensor_Interface
      ; handler : TypedEventHandler_IActivitySensor_add_ReadingChanged
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_ReadingChanged
   (
      This       : access IActivitySensor_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IActivitySensorReading : aliased constant Windows.IID := (2232572566, 5234, 16546, (178, 174, 225, 239, 41, 34, 108, 120 ));
   
   type IActivitySensorReading_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Timestamp
   (
      This       : access IActivitySensorReading_Interface
      ; RetVal : access Windows.Foundation.DateTime
   )
   return Windows.HRESULT is abstract;
   
   function get_Activity
   (
      This       : access IActivitySensorReading_Interface
      ; RetVal : access Windows.Devices.Sensors.ActivityType
   )
   return Windows.HRESULT is abstract;
   
   function get_Confidence
   (
      This       : access IActivitySensorReading_Interface
      ; RetVal : access Windows.Devices.Sensors.ActivitySensorReadingConfidence
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IActivitySensorReadingChangedEventArgs : aliased constant Windows.IID := (3728238359, 44726, 20167, (148, 106, 217, 204, 25, 185, 81, 236 ));
   
   type IActivitySensorReadingChangedEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Reading
   (
      This       : access IActivitySensorReadingChangedEventArgs_Interface
      ; RetVal : access Windows.Devices.Sensors.IActivitySensorReading
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IActivitySensorReadingChangeReport : aliased constant Windows.IID := (1329342741, 55611, 18365, (150, 10, 242, 15, 178, 243, 34, 185 ));
   
   type IActivitySensorReadingChangeReport_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Reading
   (
      This       : access IActivitySensorReadingChangeReport_Interface
      ; RetVal : access Windows.Devices.Sensors.IActivitySensorReading
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IActivitySensorTriggerDetails : aliased constant Windows.IID := (748578322, 47562, 18039, (178, 99, 36, 50, 151, 247, 157, 58 ));
   
   type IActivitySensorTriggerDetails_Interface is interface and Windows.IInspectable_Interface;
   
   function ReadReports
   (
      This       : access IActivitySensorTriggerDetails_Interface
      ; RetVal : access Windows.Devices.Sensors.IVectorView_IActivitySensorReadingChangeReport -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IBarometerStatics : aliased constant Windows.IID := (678110986, 739, 20358, (132, 252, 253, 216, 146, 181, 148, 15 ));
   
   type IBarometerStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function GetDefault
   (
      This       : access IBarometerStatics_Interface
      ; RetVal : access Windows.Devices.Sensors.IBarometer
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IBarometerStatics2 : aliased constant Windows.IID := (2412163559, 38399, 17580, (135, 142, 214, 92, 131, 8, 195, 76 ));
   
   type IBarometerStatics2_Interface is interface and Windows.IInspectable_Interface;
   
   function FromIdAsync
   (
      This       : access IBarometerStatics2_Interface
      ; deviceId : Windows.String
      ; RetVal : access Windows.Devices.Sensors.IAsyncOperation_IBarometer -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function GetDeviceSelector
   (
      This       : access IBarometerStatics2_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IBarometer : aliased constant Windows.IID := (2470737320, 30911, 17711, (176, 23, 240, 32, 156, 230, 218, 180 ));
   
   type IBarometer_Interface is interface and Windows.IInspectable_Interface;
   
   function GetCurrentReading
   (
      This       : access IBarometer_Interface
      ; RetVal : access Windows.Devices.Sensors.IBarometerReading
   )
   return Windows.HRESULT is abstract;
   
   function get_DeviceId
   (
      This       : access IBarometer_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_MinimumReportInterval
   (
      This       : access IBarometer_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function put_ReportInterval
   (
      This       : access IBarometer_Interface
      ; value : Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function get_ReportInterval
   (
      This       : access IBarometer_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function add_ReadingChanged
   (
      This       : access IBarometer_Interface
      ; handler : TypedEventHandler_IBarometer_add_ReadingChanged
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_ReadingChanged
   (
      This       : access IBarometer_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IBarometer2 : aliased constant Windows.IID := (851231768, 16107, 19716, (149, 116, 118, 51, 168, 120, 31, 159 ));
   
   type IBarometer2_Interface is interface and Windows.IInspectable_Interface;
   
   function put_ReportLatency
   (
      This       : access IBarometer2_Interface
      ; value : Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function get_ReportLatency
   (
      This       : access IBarometer2_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function get_MaxBatchSize
   (
      This       : access IBarometer2_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IBarometerReading : aliased constant Windows.IID := (4122596070, 7670, 18970, (167, 173, 50, 29, 79, 93, 178, 71 ));
   
   type IBarometerReading_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Timestamp
   (
      This       : access IBarometerReading_Interface
      ; RetVal : access Windows.Foundation.DateTime
   )
   return Windows.HRESULT is abstract;
   
   function get_StationPressureInHectopascals
   (
      This       : access IBarometerReading_Interface
      ; RetVal : access Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IBarometerReading2 : aliased constant Windows.IID := (2242004203, 37061, 18549, (137, 28, 56, 101, 180, 195, 87, 231 ));
   
   type IBarometerReading2_Interface is interface and Windows.IInspectable_Interface;
   
   function get_PerformanceCount
   (
      This       : access IBarometerReading2_Interface
      ; RetVal : access Windows.Foundation.IReference_TimeSpan -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_Properties
   (
      This       : access IBarometerReading2_Interface
      ; RetVal : access Windows.Address -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IBarometerReadingChangedEventArgs : aliased constant Windows.IID := (1032098911, 891, 16463, (155, 187, 98, 50, 214, 149, 67, 195 ));
   
   type IBarometerReadingChangedEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Reading
   (
      This       : access IBarometerReadingChangedEventArgs_Interface
      ; RetVal : access Windows.Devices.Sensors.IBarometerReading
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IPedometerReading : aliased constant Windows.IID := (575003892, 43233, 17199, (137, 106, 190, 13, 217, 176, 45, 36 ));
   
   type IPedometerReading_Interface is interface and Windows.IInspectable_Interface;
   
   function get_StepKind
   (
      This       : access IPedometerReading_Interface
      ; RetVal : access Windows.Devices.Sensors.PedometerStepKind
   )
   return Windows.HRESULT is abstract;
   
   function get_CumulativeSteps
   (
      This       : access IPedometerReading_Interface
      ; RetVal : access Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   function get_Timestamp
   (
      This       : access IPedometerReading_Interface
      ; RetVal : access Windows.Foundation.DateTime
   )
   return Windows.HRESULT is abstract;
   
   function get_CumulativeStepsDuration
   (
      This       : access IPedometerReading_Interface
      ; RetVal : access Windows.Foundation.TimeSpan
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IPedometerReadingChangedEventArgs : aliased constant Windows.IID := (4166378622, 43964, 17494, (134, 168, 37, 207, 43, 51, 55, 66 ));
   
   type IPedometerReadingChangedEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Reading
   (
      This       : access IPedometerReadingChangedEventArgs_Interface
      ; RetVal : access Windows.Devices.Sensors.IPedometerReading
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IPedometerStatics : aliased constant Windows.IID := (2191002159, 16515, 19963, (180, 17, 147, 142, 160, 244, 185, 70 ));
   
   type IPedometerStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function FromIdAsync
   (
      This       : access IPedometerStatics_Interface
      ; deviceId : Windows.String
      ; RetVal : access Windows.Devices.Sensors.IAsyncOperation_IPedometer -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function GetDefaultAsync
   (
      This       : access IPedometerStatics_Interface
      ; RetVal : access Windows.Devices.Sensors.IAsyncOperation_IPedometer -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function GetDeviceSelector
   (
      This       : access IPedometerStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function GetSystemHistoryAsync
   (
      This       : access IPedometerStatics_Interface
      ; fromTime : Windows.Foundation.DateTime
      ; RetVal : access Windows.Address -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function GetSystemHistoryWithDurationAsync
   (
      This       : access IPedometerStatics_Interface
      ; fromTime : Windows.Foundation.DateTime
      ; duration : Windows.Foundation.TimeSpan
      ; RetVal : access Windows.Address -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IPedometerStatics2 : aliased constant Windows.IID := (2046150331, 52750, 16691, (180, 126, 134, 39, 234, 114, 246, 119 ));
   
   type IPedometerStatics2_Interface is interface and Windows.IInspectable_Interface;
   
   function GetReadingsFromTriggerDetails
   (
      This       : access IPedometerStatics2_Interface
      ; triggerDetails : Windows.Devices.Sensors.ISensorDataThresholdTriggerDetails
      ; RetVal : access Windows.Devices.Sensors.IVectorView_IPedometerReading -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IPedometer2 : aliased constant Windows.IID := (3852732127, 11137, 19165, (178, 255, 119, 171, 108, 152, 186, 25 ));
   
   type IPedometer2_Interface is interface and Windows.IInspectable_Interface;
   
   function GetCurrentReadings
   (
      This       : access IPedometer2_Interface
      ; RetVal : access Windows.Address -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IPedometer : aliased constant Windows.IID := (2585657661, 15768, 17912, (137, 32, 142, 78, 202, 202, 95, 151 ));
   
   type IPedometer_Interface is interface and Windows.IInspectable_Interface;
   
   function get_DeviceId
   (
      This       : access IPedometer_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_PowerInMilliwatts
   (
      This       : access IPedometer_Interface
      ; RetVal : access Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function get_MinimumReportInterval
   (
      This       : access IPedometer_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function put_ReportInterval
   (
      This       : access IPedometer_Interface
      ; value : Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function get_ReportInterval
   (
      This       : access IPedometer_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function add_ReadingChanged
   (
      This       : access IPedometer_Interface
      ; handler : TypedEventHandler_IPedometer_add_ReadingChanged
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_ReadingChanged
   (
      This       : access IPedometer_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IPedometerDataThresholdFactory : aliased constant Windows.IID := (3417149264, 31316, 18027, (144, 16, 119, 161, 98, 252, 165, 215 ));
   
   type IPedometerDataThresholdFactory_Interface is interface and Windows.IInspectable_Interface;
   
   function Create
   (
      This       : access IPedometerDataThresholdFactory_Interface
      ; sensor : Windows.Devices.Sensors.IPedometer
      ; stepGoal : Windows.Int32
      ; RetVal : access Windows.Devices.Sensors.ISensorDataThreshold
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IProximitySensorStatics : aliased constant Windows.IID := (689464905, 25193, 20055, (165, 173, 130, 190, 128, 129, 51, 146 ));
   
   type IProximitySensorStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function GetDeviceSelector
   (
      This       : access IProximitySensorStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function FromId
   (
      This       : access IProximitySensorStatics_Interface
      ; sensorId : Windows.String
      ; RetVal : access Windows.Devices.Sensors.IProximitySensor
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IProximitySensor : aliased constant Windows.IID := (1421899448, 60667, 18756, (185, 40, 116, 252, 80, 77, 71, 238 ));
   
   type IProximitySensor_Interface is interface and Windows.IInspectable_Interface;
   
   function get_DeviceId
   (
      This       : access IProximitySensor_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_MaxDistanceInMillimeters
   (
      This       : access IProximitySensor_Interface
      ; RetVal : access Windows.Foundation.IReference_UInt32 -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_MinDistanceInMillimeters
   (
      This       : access IProximitySensor_Interface
      ; RetVal : access Windows.Foundation.IReference_UInt32 -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function GetCurrentReading
   (
      This       : access IProximitySensor_Interface
      ; RetVal : access Windows.Devices.Sensors.IProximitySensorReading
   )
   return Windows.HRESULT is abstract;
   
   function add_ReadingChanged
   (
      This       : access IProximitySensor_Interface
      ; handler : TypedEventHandler_IProximitySensor_add_ReadingChanged
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_ReadingChanged
   (
      This       : access IProximitySensor_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function CreateDisplayOnOffController
   (
      This       : access IProximitySensor_Interface
      ; RetVal : access Windows.Foundation.IClosable
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IProximitySensorReadingChangedEventArgs : aliased constant Windows.IID := (3485660006, 50152, 16637, (140, 195, 103, 226, 137, 0, 73, 56 ));
   
   type IProximitySensorReadingChangedEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Reading
   (
      This       : access IProximitySensorReadingChangedEventArgs_Interface
      ; RetVal : access Windows.Devices.Sensors.IProximitySensorReading
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IProximitySensorReading : aliased constant Windows.IID := (1898089817, 4909, 19807, (143, 249, 47, 13, 184, 117, 28, 237 ));
   
   type IProximitySensorReading_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Timestamp
   (
      This       : access IProximitySensorReading_Interface
      ; RetVal : access Windows.Foundation.DateTime
   )
   return Windows.HRESULT is abstract;
   
   function get_IsDetected
   (
      This       : access IProximitySensorReading_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_DistanceInMillimeters
   (
      This       : access IProximitySensorReading_Interface
      ; RetVal : access Windows.Foundation.IReference_UInt32 -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IProximitySensorDataThresholdFactory : aliased constant Windows.IID := (2421866785, 27943, 19155, (157, 181, 100, 103, 242, 165, 173, 157 ));
   
   type IProximitySensorDataThresholdFactory_Interface is interface and Windows.IInspectable_Interface;
   
   function Create
   (
      This       : access IProximitySensorDataThresholdFactory_Interface
      ; sensor : Windows.Devices.Sensors.IProximitySensor
      ; RetVal : access Windows.Devices.Sensors.ISensorDataThreshold
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IProximitySensorStatics2 : aliased constant Windows.IID := (3421795246, 59850, 16943, (173, 103, 76, 61, 37, 223, 53, 12 ));
   
   type IProximitySensorStatics2_Interface is interface and Windows.IInspectable_Interface;
   
   function GetReadingsFromTriggerDetails
   (
      This       : access IProximitySensorStatics2_Interface
      ; triggerDetails : Windows.Devices.Sensors.ISensorDataThresholdTriggerDetails
      ; RetVal : access Windows.Devices.Sensors.IVectorView_IProximitySensorReading -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IAltimeterStatics : aliased constant Windows.IID := (2662651843, 58796, 18382, (142, 239, 211, 113, 129, 104, 192, 31 ));
   
   type IAltimeterStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function GetDefault
   (
      This       : access IAltimeterStatics_Interface
      ; RetVal : access Windows.Devices.Sensors.IAltimeter
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IAltimeter : aliased constant Windows.IID := (1928353789, 36612, 18929, (180, 167, 244, 227, 99, 183, 1, 162 ));
   
   type IAltimeter_Interface is interface and Windows.IInspectable_Interface;
   
   function GetCurrentReading
   (
      This       : access IAltimeter_Interface
      ; RetVal : access Windows.Devices.Sensors.IAltimeterReading
   )
   return Windows.HRESULT is abstract;
   
   function get_DeviceId
   (
      This       : access IAltimeter_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_MinimumReportInterval
   (
      This       : access IAltimeter_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function put_ReportInterval
   (
      This       : access IAltimeter_Interface
      ; value : Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function get_ReportInterval
   (
      This       : access IAltimeter_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function add_ReadingChanged
   (
      This       : access IAltimeter_Interface
      ; handler : TypedEventHandler_IAltimeter_add_ReadingChanged
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_ReadingChanged
   (
      This       : access IAltimeter_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IAltimeter2 : aliased constant Windows.IID := (3376880633, 10973, 18677, (159, 8, 61, 12, 118, 96, 217, 56 ));
   
   type IAltimeter2_Interface is interface and Windows.IInspectable_Interface;
   
   function put_ReportLatency
   (
      This       : access IAltimeter2_Interface
      ; value : Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function get_ReportLatency
   (
      This       : access IAltimeter2_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function get_MaxBatchSize
   (
      This       : access IAltimeter2_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IAltimeterReading : aliased constant Windows.IID := (4226346867, 32606, 18632, (170, 26, 241, 243, 190, 252, 17, 68 ));
   
   type IAltimeterReading_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Timestamp
   (
      This       : access IAltimeterReading_Interface
      ; RetVal : access Windows.Foundation.DateTime
   )
   return Windows.HRESULT is abstract;
   
   function get_AltitudeChangeInMeters
   (
      This       : access IAltimeterReading_Interface
      ; RetVal : access Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IAltimeterReading2 : aliased constant Windows.IID := (1413094361, 27915, 17074, (189, 105, 188, 143, 174, 15, 120, 44 ));
   
   type IAltimeterReading2_Interface is interface and Windows.IInspectable_Interface;
   
   function get_PerformanceCount
   (
      This       : access IAltimeterReading2_Interface
      ; RetVal : access Windows.Foundation.IReference_TimeSpan -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_Properties
   (
      This       : access IAltimeterReading2_Interface
      ; RetVal : access Windows.Address -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IAltimeterReadingChangedEventArgs : aliased constant Windows.IID := (1885982839, 17517, 18423, (153, 140, 235, 194, 59, 69, 228, 162 ));
   
   type IAltimeterReadingChangedEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Reading
   (
      This       : access IAltimeterReadingChangedEventArgs_Interface
      ; RetVal : access Windows.Devices.Sensors.IAltimeterReading
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IAsyncOperation_IAccelerometer : aliased constant Windows.IID := (4235599163, 24141, 20808, (166, 24, 123, 103, 112, 89, 208, 184 ));
   
   type IAsyncOperation_IAccelerometer_Interface is interface and Windows.IInspectable_Interface;
   
   function put_Completed
   (
      This       : access IAsyncOperation_IAccelerometer_Interface
      ; handler : Windows.Devices.Sensors.AsyncOperationCompletedHandler_IAccelerometer
   )
   return Windows.HRESULT is abstract;
   
   function get_Completed
   (
      This       : access IAsyncOperation_IAccelerometer_Interface
      ; RetVal : access Windows.Devices.Sensors.AsyncOperationCompletedHandler_IAccelerometer
   )
   return Windows.HRESULT is abstract;
   
   function GetResults
   (
      This       : access IAsyncOperation_IAccelerometer_Interface
      ; RetVal : access Windows.Devices.Sensors.IAccelerometer
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IAsyncOperation_IInclinometer : aliased constant Windows.IID := (2230039702, 46746, 21453, (182, 144, 164, 97, 137, 130, 43, 1 ));
   
   type IAsyncOperation_IInclinometer_Interface is interface and Windows.IInspectable_Interface;
   
   function put_Completed
   (
      This       : access IAsyncOperation_IInclinometer_Interface
      ; handler : Windows.Devices.Sensors.AsyncOperationCompletedHandler_IInclinometer
   )
   return Windows.HRESULT is abstract;
   
   function get_Completed
   (
      This       : access IAsyncOperation_IInclinometer_Interface
      ; RetVal : access Windows.Devices.Sensors.AsyncOperationCompletedHandler_IInclinometer
   )
   return Windows.HRESULT is abstract;
   
   function GetResults
   (
      This       : access IAsyncOperation_IInclinometer_Interface
      ; RetVal : access Windows.Devices.Sensors.IInclinometer
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IAsyncOperation_IGyrometer : aliased constant Windows.IID := (4243487423, 7631, 20684, (185, 27, 122, 31, 89, 224, 194, 139 ));
   
   type IAsyncOperation_IGyrometer_Interface is interface and Windows.IInspectable_Interface;
   
   function put_Completed
   (
      This       : access IAsyncOperation_IGyrometer_Interface
      ; handler : Windows.Devices.Sensors.AsyncOperationCompletedHandler_IGyrometer
   )
   return Windows.HRESULT is abstract;
   
   function get_Completed
   (
      This       : access IAsyncOperation_IGyrometer_Interface
      ; RetVal : access Windows.Devices.Sensors.AsyncOperationCompletedHandler_IGyrometer
   )
   return Windows.HRESULT is abstract;
   
   function GetResults
   (
      This       : access IAsyncOperation_IGyrometer_Interface
      ; RetVal : access Windows.Devices.Sensors.IGyrometer
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IAsyncOperation_ICompass : aliased constant Windows.IID := (1385677388, 42747, 24067, (164, 248, 238, 20, 60, 67, 93, 248 ));
   
   type IAsyncOperation_ICompass_Interface is interface and Windows.IInspectable_Interface;
   
   function put_Completed
   (
      This       : access IAsyncOperation_ICompass_Interface
      ; handler : Windows.Devices.Sensors.AsyncOperationCompletedHandler_ICompass
   )
   return Windows.HRESULT is abstract;
   
   function get_Completed
   (
      This       : access IAsyncOperation_ICompass_Interface
      ; RetVal : access Windows.Devices.Sensors.AsyncOperationCompletedHandler_ICompass
   )
   return Windows.HRESULT is abstract;
   
   function GetResults
   (
      This       : access IAsyncOperation_ICompass_Interface
      ; RetVal : access Windows.Devices.Sensors.ICompass
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IAsyncOperation_ILightSensor : aliased constant Windows.IID := (940464428, 18336, 24052, (141, 226, 178, 238, 250, 157, 184, 173 ));
   
   type IAsyncOperation_ILightSensor_Interface is interface and Windows.IInspectable_Interface;
   
   function put_Completed
   (
      This       : access IAsyncOperation_ILightSensor_Interface
      ; handler : Windows.Devices.Sensors.AsyncOperationCompletedHandler_ILightSensor
   )
   return Windows.HRESULT is abstract;
   
   function get_Completed
   (
      This       : access IAsyncOperation_ILightSensor_Interface
      ; RetVal : access Windows.Devices.Sensors.AsyncOperationCompletedHandler_ILightSensor
   )
   return Windows.HRESULT is abstract;
   
   function GetResults
   (
      This       : access IAsyncOperation_ILightSensor_Interface
      ; RetVal : access Windows.Devices.Sensors.ILightSensor
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IAsyncOperation_IOrientationSensor : aliased constant Windows.IID := (2398317224, 28525, 21387, (164, 43, 55, 175, 115, 105, 4, 158 ));
   
   type IAsyncOperation_IOrientationSensor_Interface is interface and Windows.IInspectable_Interface;
   
   function put_Completed
   (
      This       : access IAsyncOperation_IOrientationSensor_Interface
      ; handler : Windows.Devices.Sensors.AsyncOperationCompletedHandler_IOrientationSensor
   )
   return Windows.HRESULT is abstract;
   
   function get_Completed
   (
      This       : access IAsyncOperation_IOrientationSensor_Interface
      ; RetVal : access Windows.Devices.Sensors.AsyncOperationCompletedHandler_IOrientationSensor
   )
   return Windows.HRESULT is abstract;
   
   function GetResults
   (
      This       : access IAsyncOperation_IOrientationSensor_Interface
      ; RetVal : access Windows.Devices.Sensors.IOrientationSensor
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IAsyncOperation_IMagnetometer : aliased constant Windows.IID := (2957333571, 59280, 23203, (135, 103, 73, 50, 3, 34, 116, 238 ));
   
   type IAsyncOperation_IMagnetometer_Interface is interface and Windows.IInspectable_Interface;
   
   function put_Completed
   (
      This       : access IAsyncOperation_IMagnetometer_Interface
      ; handler : Windows.Devices.Sensors.AsyncOperationCompletedHandler_IMagnetometer
   )
   return Windows.HRESULT is abstract;
   
   function get_Completed
   (
      This       : access IAsyncOperation_IMagnetometer_Interface
      ; RetVal : access Windows.Devices.Sensors.AsyncOperationCompletedHandler_IMagnetometer
   )
   return Windows.HRESULT is abstract;
   
   function GetResults
   (
      This       : access IAsyncOperation_IMagnetometer_Interface
      ; RetVal : access Windows.Devices.Sensors.IMagnetometer
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IAsyncOperation_IActivitySensor : aliased constant Windows.IID := (3274703790, 59310, 22315, (141, 85, 125, 177, 151, 53, 108, 48 ));
   
   type IAsyncOperation_IActivitySensor_Interface is interface and Windows.IInspectable_Interface;
   
   function put_Completed
   (
      This       : access IAsyncOperation_IActivitySensor_Interface
      ; handler : Windows.Devices.Sensors.AsyncOperationCompletedHandler_IActivitySensor
   )
   return Windows.HRESULT is abstract;
   
   function get_Completed
   (
      This       : access IAsyncOperation_IActivitySensor_Interface
      ; RetVal : access Windows.Devices.Sensors.AsyncOperationCompletedHandler_IActivitySensor
   )
   return Windows.HRESULT is abstract;
   
   function GetResults
   (
      This       : access IAsyncOperation_IActivitySensor_Interface
      ; RetVal : access Windows.Devices.Sensors.IActivitySensor
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IAsyncOperation_IActivitySensorReading : aliased constant Windows.IID := (2041084265, 12927, 23418, (160, 211, 115, 234, 177, 109, 226, 28 ));
   
   type IAsyncOperation_IActivitySensorReading_Interface is interface and Windows.IInspectable_Interface;
   
   function put_Completed
   (
      This       : access IAsyncOperation_IActivitySensorReading_Interface
      ; handler : Windows.Devices.Sensors.AsyncOperationCompletedHandler_IActivitySensorReading
   )
   return Windows.HRESULT is abstract;
   
   function get_Completed
   (
      This       : access IAsyncOperation_IActivitySensorReading_Interface
      ; RetVal : access Windows.Devices.Sensors.AsyncOperationCompletedHandler_IActivitySensorReading
   )
   return Windows.HRESULT is abstract;
   
   function GetResults
   (
      This       : access IAsyncOperation_IActivitySensorReading_Interface
      ; RetVal : access Windows.Devices.Sensors.IActivitySensorReading
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IIterator_ActivityType : aliased constant Windows.IID := (1079132801, 42950, 20657, (182, 245, 11, 170, 149, 217, 2, 194 ));
   
   type IIterator_ActivityType_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Current
   (
      This       : access IIterator_ActivityType_Interface
      ; RetVal : access Windows.Devices.Sensors.ActivityType
   )
   return Windows.HRESULT is abstract;
   
   function get_HasCurrent
   (
      This       : access IIterator_ActivityType_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function MoveNext
   (
      This       : access IIterator_ActivityType_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IIterator_ActivityType_Interface
      ; items : Windows.Devices.Sensors.ActivityType_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IIterable_ActivityType : aliased constant Windows.IID := (704957946, 24061, 20856, (135, 49, 173, 233, 152, 228, 167, 246 ));
   
   type IIterable_ActivityType_Interface is interface and Windows.IInspectable_Interface;
   
   function First
   (
      This       : access IIterable_ActivityType_Interface
      ; RetVal : access Windows.Devices.Sensors.IIterator_ActivityType
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IVectorView_ActivityType : aliased constant Windows.IID := (4235854984, 10243, 20572, (158, 98, 146, 0, 175, 228, 22, 198 ));
   
   type IVectorView_ActivityType_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVectorView_ActivityType_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.Devices.Sensors.ActivityType
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVectorView_ActivityType_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVectorView_ActivityType_Interface
      ; value : Windows.Devices.Sensors.ActivityType
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVectorView_ActivityType_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.Devices.Sensors.ActivityType_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IVector_ActivityType : aliased constant Windows.IID := (3823526102, 53313, 24269, (177, 139, 250, 37, 78, 74, 134, 15 ));
   
   type IVector_ActivityType_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVector_ActivityType_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.Devices.Sensors.ActivityType
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVector_ActivityType_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function GetView
   (
      This       : access IVector_ActivityType_Interface
      ; RetVal : access Windows.Devices.Sensors.IVectorView_ActivityType
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVector_ActivityType_Interface
      ; value : Windows.Devices.Sensors.ActivityType
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function SetAt
   (
      This       : access IVector_ActivityType_Interface
      ; index : Windows.UInt32
      ; value : Windows.Devices.Sensors.ActivityType
   )
   return Windows.HRESULT is abstract;
   
   function InsertAt
   (
      This       : access IVector_ActivityType_Interface
      ; index : Windows.UInt32
      ; value : Windows.Devices.Sensors.ActivityType
   )
   return Windows.HRESULT is abstract;
   
   function RemoveAt
   (
      This       : access IVector_ActivityType_Interface
      ; index : Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function Append
   (
      This       : access IVector_ActivityType_Interface
      ; value : Windows.Devices.Sensors.ActivityType
   )
   return Windows.HRESULT is abstract;
   
   function RemoveAtEnd
   (
      This       : access IVector_ActivityType_Interface
   )
   return Windows.HRESULT is abstract;
   
   function Clear
   (
      This       : access IVector_ActivityType_Interface
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVector_ActivityType_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.Devices.Sensors.ActivityType_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function ReplaceAll
   (
      This       : access IVector_ActivityType_Interface
      ; items : Windows.Devices.Sensors.ActivityType_Ptr
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IIterator_IActivitySensorReadingChangeReport : aliased constant Windows.IID := (2617705294, 33587, 22997, (141, 96, 14, 63, 4, 56, 172, 18 ));
   
   type IIterator_IActivitySensorReadingChangeReport_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Current
   (
      This       : access IIterator_IActivitySensorReadingChangeReport_Interface
      ; RetVal : access Windows.Devices.Sensors.IActivitySensorReadingChangeReport
   )
   return Windows.HRESULT is abstract;
   
   function get_HasCurrent
   (
      This       : access IIterator_IActivitySensorReadingChangeReport_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function MoveNext
   (
      This       : access IIterator_IActivitySensorReadingChangeReport_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IIterator_IActivitySensorReadingChangeReport_Interface
      ; items : Windows.Devices.Sensors.IActivitySensorReadingChangeReport_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IIterable_IActivitySensorReadingChangeReport : aliased constant Windows.IID := (1427786082, 40598, 24171, (139, 138, 101, 238, 61, 0, 70, 243 ));
   
   type IIterable_IActivitySensorReadingChangeReport_Interface is interface and Windows.IInspectable_Interface;
   
   function First
   (
      This       : access IIterable_IActivitySensorReadingChangeReport_Interface
      ; RetVal : access Windows.Devices.Sensors.IIterator_IActivitySensorReadingChangeReport
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IVectorView_IActivitySensorReadingChangeReport : aliased constant Windows.IID := (283413120, 56682, 22276, (143, 61, 61, 70, 17, 31, 57, 30 ));
   
   type IVectorView_IActivitySensorReadingChangeReport_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVectorView_IActivitySensorReadingChangeReport_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.Devices.Sensors.IActivitySensorReadingChangeReport
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVectorView_IActivitySensorReadingChangeReport_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVectorView_IActivitySensorReadingChangeReport_Interface
      ; value : Windows.Devices.Sensors.IActivitySensorReadingChangeReport
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVectorView_IActivitySensorReadingChangeReport_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.Devices.Sensors.IActivitySensorReadingChangeReport_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IAsyncOperation_IBarometer : aliased constant Windows.IID := (1367826487, 40758, 23686, (133, 93, 61, 221, 37, 29, 249, 168 ));
   
   type IAsyncOperation_IBarometer_Interface is interface and Windows.IInspectable_Interface;
   
   function put_Completed
   (
      This       : access IAsyncOperation_IBarometer_Interface
      ; handler : Windows.Devices.Sensors.AsyncOperationCompletedHandler_IBarometer
   )
   return Windows.HRESULT is abstract;
   
   function get_Completed
   (
      This       : access IAsyncOperation_IBarometer_Interface
      ; RetVal : access Windows.Devices.Sensors.AsyncOperationCompletedHandler_IBarometer
   )
   return Windows.HRESULT is abstract;
   
   function GetResults
   (
      This       : access IAsyncOperation_IBarometer_Interface
      ; RetVal : access Windows.Devices.Sensors.IBarometer
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IAsyncOperation_IPedometer : aliased constant Windows.IID := (2484353167, 6974, 22005, (129, 155, 171, 56, 51, 100, 96, 85 ));
   
   type IAsyncOperation_IPedometer_Interface is interface and Windows.IInspectable_Interface;
   
   function put_Completed
   (
      This       : access IAsyncOperation_IPedometer_Interface
      ; handler : Windows.Devices.Sensors.AsyncOperationCompletedHandler_IPedometer
   )
   return Windows.HRESULT is abstract;
   
   function get_Completed
   (
      This       : access IAsyncOperation_IPedometer_Interface
      ; RetVal : access Windows.Devices.Sensors.AsyncOperationCompletedHandler_IPedometer
   )
   return Windows.HRESULT is abstract;
   
   function GetResults
   (
      This       : access IAsyncOperation_IPedometer_Interface
      ; RetVal : access Windows.Devices.Sensors.IPedometer
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IIterator_IPedometerReading : aliased constant Windows.IID := (180817619, 34131, 24307, (146, 248, 67, 134, 9, 98, 48, 135 ));
   
   type IIterator_IPedometerReading_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Current
   (
      This       : access IIterator_IPedometerReading_Interface
      ; RetVal : access Windows.Devices.Sensors.IPedometerReading
   )
   return Windows.HRESULT is abstract;
   
   function get_HasCurrent
   (
      This       : access IIterator_IPedometerReading_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function MoveNext
   (
      This       : access IIterator_IPedometerReading_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IIterator_IPedometerReading_Interface
      ; items : Windows.Devices.Sensors.IPedometerReading_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IIterable_IPedometerReading : aliased constant Windows.IID := (3149273692, 39107, 22296, (136, 254, 83, 146, 167, 69, 30, 45 ));
   
   type IIterable_IPedometerReading_Interface is interface and Windows.IInspectable_Interface;
   
   function First
   (
      This       : access IIterable_IPedometerReading_Interface
      ; RetVal : access Windows.Devices.Sensors.IIterator_IPedometerReading
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IVectorView_IPedometerReading : aliased constant Windows.IID := (1376218972, 30776, 21721, (149, 23, 85, 17, 235, 98, 121, 82 ));
   
   type IVectorView_IPedometerReading_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVectorView_IPedometerReading_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.Devices.Sensors.IPedometerReading
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVectorView_IPedometerReading_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVectorView_IPedometerReading_Interface
      ; value : Windows.Devices.Sensors.IPedometerReading
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVectorView_IPedometerReading_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.Devices.Sensors.IPedometerReading_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IIterator_IProximitySensorReading : aliased constant Windows.IID := (491718879, 32585, 22331, (147, 106, 109, 77, 78, 97, 9, 48 ));
   
   type IIterator_IProximitySensorReading_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Current
   (
      This       : access IIterator_IProximitySensorReading_Interface
      ; RetVal : access Windows.Devices.Sensors.IProximitySensorReading
   )
   return Windows.HRESULT is abstract;
   
   function get_HasCurrent
   (
      This       : access IIterator_IProximitySensorReading_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function MoveNext
   (
      This       : access IIterator_IProximitySensorReading_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IIterator_IProximitySensorReading_Interface
      ; items : Windows.Devices.Sensors.IProximitySensorReading_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IIterable_IProximitySensorReading : aliased constant Windows.IID := (807320783, 4523, 24208, (152, 238, 189, 153, 192, 227, 187, 118 ));
   
   type IIterable_IProximitySensorReading_Interface is interface and Windows.IInspectable_Interface;
   
   function First
   (
      This       : access IIterable_IProximitySensorReading_Interface
      ; RetVal : access Windows.Devices.Sensors.IIterator_IProximitySensorReading
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IVectorView_IProximitySensorReading : aliased constant Windows.IID := (2047465324, 36077, 24112, (183, 254, 31, 247, 77, 77, 152, 20 ));
   
   type IVectorView_IProximitySensorReading_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVectorView_IProximitySensorReading_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.Devices.Sensors.IProximitySensorReading
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVectorView_IProximitySensorReading_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVectorView_IProximitySensorReading_Interface
      ; value : Windows.Devices.Sensors.IProximitySensorReading
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVectorView_IProximitySensorReading_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.Devices.Sensors.IProximitySensorReading_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   -- Delegates/Events
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   
   IID_AsyncOperationCompletedHandler_IAccelerometer : aliased constant Windows.IID := (3351460278, 29991, 20522, (138, 76, 203, 155, 239, 225, 88, 64 ));
   
   type AsyncOperationCompletedHandler_IAccelerometer_Interface(Callback : access procedure (asyncInfo : Windows.Devices.Sensors.IAsyncOperation_IAccelerometer ; asyncStatus : Windows.Foundation.AsyncStatus)) is new Windows.IMulticastDelegate_Interface(IID_AsyncOperationCompletedHandler_IAccelerometer'access) with null record;
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_IAccelerometer_Interface
      ; asyncInfo : Windows.Devices.Sensors.IAsyncOperation_IAccelerometer
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_IAccelerometer_add_ReadingChanged : aliased constant Windows.IID := (2783460928, 46487, 23427, (146, 245, 91, 237, 57, 38, 202, 128 ));
   
   type TypedEventHandler_IAccelerometer_add_ReadingChanged_Interface(Callback : access procedure (sender : Windows.Devices.Sensors.IAccelerometer ; args : Windows.Devices.Sensors.IAccelerometerReadingChangedEventArgs)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_IAccelerometer_add_ReadingChanged'access) with null record;
   function Invoke
   (
      This       : access TypedEventHandler_IAccelerometer_add_ReadingChanged_Interface
      ; sender : Windows.Devices.Sensors.IAccelerometer
      ; args : Windows.Devices.Sensors.IAccelerometerReadingChangedEventArgs
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_IAccelerometer_add_Shaken : aliased constant Windows.IID := (1046310575, 61801, 23904, (146, 176, 152, 205, 107, 216, 248, 8 ));
   
   type TypedEventHandler_IAccelerometer_add_Shaken_Interface(Callback : access procedure (sender : Windows.Devices.Sensors.IAccelerometer ; args : Windows.Devices.Sensors.IAccelerometerShakenEventArgs)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_IAccelerometer_add_Shaken'access) with null record;
   function Invoke
   (
      This       : access TypedEventHandler_IAccelerometer_add_Shaken_Interface
      ; sender : Windows.Devices.Sensors.IAccelerometer
      ; args : Windows.Devices.Sensors.IAccelerometerShakenEventArgs
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_AsyncOperationCompletedHandler_IInclinometer : aliased constant Windows.IID := (2400116266, 11535, 22006, (149, 102, 60, 33, 56, 95, 174, 100 ));
   
   type AsyncOperationCompletedHandler_IInclinometer_Interface(Callback : access procedure (asyncInfo : Windows.Devices.Sensors.IAsyncOperation_IInclinometer ; asyncStatus : Windows.Foundation.AsyncStatus)) is new Windows.IMulticastDelegate_Interface(IID_AsyncOperationCompletedHandler_IInclinometer'access) with null record;
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_IInclinometer_Interface
      ; asyncInfo : Windows.Devices.Sensors.IAsyncOperation_IInclinometer
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_IInclinometer_add_ReadingChanged : aliased constant Windows.IID := (1866154271, 53575, 23025, (187, 228, 123, 236, 57, 108, 123, 110 ));
   
   type TypedEventHandler_IInclinometer_add_ReadingChanged_Interface(Callback : access procedure (sender : Windows.Devices.Sensors.IInclinometer ; args : Windows.Devices.Sensors.IInclinometerReadingChangedEventArgs)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_IInclinometer_add_ReadingChanged'access) with null record;
   function Invoke
   (
      This       : access TypedEventHandler_IInclinometer_add_ReadingChanged_Interface
      ; sender : Windows.Devices.Sensors.IInclinometer
      ; args : Windows.Devices.Sensors.IInclinometerReadingChangedEventArgs
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_AsyncOperationCompletedHandler_IGyrometer : aliased constant Windows.IID := (360289537, 38286, 21269, (162, 74, 13, 125, 122, 203, 199, 156 ));
   
   type AsyncOperationCompletedHandler_IGyrometer_Interface(Callback : access procedure (asyncInfo : Windows.Devices.Sensors.IAsyncOperation_IGyrometer ; asyncStatus : Windows.Foundation.AsyncStatus)) is new Windows.IMulticastDelegate_Interface(IID_AsyncOperationCompletedHandler_IGyrometer'access) with null record;
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_IGyrometer_Interface
      ; asyncInfo : Windows.Devices.Sensors.IAsyncOperation_IGyrometer
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_IGyrometer_add_ReadingChanged : aliased constant Windows.IID := (353834276, 22406, 22949, (175, 91, 160, 18, 69, 114, 108, 68 ));
   
   type TypedEventHandler_IGyrometer_add_ReadingChanged_Interface(Callback : access procedure (sender : Windows.Devices.Sensors.IGyrometer ; args : Windows.Devices.Sensors.IGyrometerReadingChangedEventArgs)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_IGyrometer_add_ReadingChanged'access) with null record;
   function Invoke
   (
      This       : access TypedEventHandler_IGyrometer_add_ReadingChanged_Interface
      ; sender : Windows.Devices.Sensors.IGyrometer
      ; args : Windows.Devices.Sensors.IGyrometerReadingChangedEventArgs
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_AsyncOperationCompletedHandler_ICompass : aliased constant Windows.IID := (217179232, 48172, 22652, (152, 34, 66, 11, 160, 77, 5, 81 ));
   
   type AsyncOperationCompletedHandler_ICompass_Interface(Callback : access procedure (asyncInfo : Windows.Devices.Sensors.IAsyncOperation_ICompass ; asyncStatus : Windows.Foundation.AsyncStatus)) is new Windows.IMulticastDelegate_Interface(IID_AsyncOperationCompletedHandler_ICompass'access) with null record;
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_ICompass_Interface
      ; asyncInfo : Windows.Devices.Sensors.IAsyncOperation_ICompass
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_ICompass_add_ReadingChanged : aliased constant Windows.IID := (3884439357, 41249, 23270, (180, 151, 171, 147, 72, 55, 229, 127 ));
   
   type TypedEventHandler_ICompass_add_ReadingChanged_Interface(Callback : access procedure (sender : Windows.Devices.Sensors.ICompass ; args : Windows.Devices.Sensors.ICompassReadingChangedEventArgs)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_ICompass_add_ReadingChanged'access) with null record;
   function Invoke
   (
      This       : access TypedEventHandler_ICompass_add_ReadingChanged_Interface
      ; sender : Windows.Devices.Sensors.ICompass
      ; args : Windows.Devices.Sensors.ICompassReadingChangedEventArgs
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_AsyncOperationCompletedHandler_ILightSensor : aliased constant Windows.IID := (1560601279, 20835, 21048, (143, 35, 206, 71, 11, 48, 52, 13 ));
   
   type AsyncOperationCompletedHandler_ILightSensor_Interface(Callback : access procedure (asyncInfo : Windows.Devices.Sensors.IAsyncOperation_ILightSensor ; asyncStatus : Windows.Foundation.AsyncStatus)) is new Windows.IMulticastDelegate_Interface(IID_AsyncOperationCompletedHandler_ILightSensor'access) with null record;
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_ILightSensor_Interface
      ; asyncInfo : Windows.Devices.Sensors.IAsyncOperation_ILightSensor
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_ILightSensor_add_ReadingChanged : aliased constant Windows.IID := (516888634, 40714, 24435, (146, 37, 90, 51, 234, 181, 89, 79 ));
   
   type TypedEventHandler_ILightSensor_add_ReadingChanged_Interface(Callback : access procedure (sender : Windows.Devices.Sensors.ILightSensor ; args : Windows.Devices.Sensors.ILightSensorReadingChangedEventArgs)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_ILightSensor_add_ReadingChanged'access) with null record;
   function Invoke
   (
      This       : access TypedEventHandler_ILightSensor_add_ReadingChanged_Interface
      ; sender : Windows.Devices.Sensors.ILightSensor
      ; args : Windows.Devices.Sensors.ILightSensorReadingChangedEventArgs
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_AsyncOperationCompletedHandler_IOrientationSensor : aliased constant Windows.IID := (2201006883, 26261, 21460, (172, 215, 182, 12, 36, 193, 184, 121 ));
   
   type AsyncOperationCompletedHandler_IOrientationSensor_Interface(Callback : access procedure (asyncInfo : Windows.Devices.Sensors.IAsyncOperation_IOrientationSensor ; asyncStatus : Windows.Foundation.AsyncStatus)) is new Windows.IMulticastDelegate_Interface(IID_AsyncOperationCompletedHandler_IOrientationSensor'access) with null record;
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_IOrientationSensor_Interface
      ; asyncInfo : Windows.Devices.Sensors.IAsyncOperation_IOrientationSensor
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_IOrientationSensor_add_ReadingChanged : aliased constant Windows.IID := (2444102723, 57847, 22397, (161, 97, 138, 175, 39, 94, 185, 39 ));
   
   type TypedEventHandler_IOrientationSensor_add_ReadingChanged_Interface(Callback : access procedure (sender : Windows.Devices.Sensors.IOrientationSensor ; args : Windows.Devices.Sensors.IOrientationSensorReadingChangedEventArgs)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_IOrientationSensor_add_ReadingChanged'access) with null record;
   function Invoke
   (
      This       : access TypedEventHandler_IOrientationSensor_add_ReadingChanged_Interface
      ; sender : Windows.Devices.Sensors.IOrientationSensor
      ; args : Windows.Devices.Sensors.IOrientationSensorReadingChangedEventArgs
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_ISimpleOrientationSensor_add_OrientationChanged : aliased constant Windows.IID := (2453897127, 60027, 24517, (142, 207, 27, 145, 27, 234, 43, 252 ));
   
   type TypedEventHandler_ISimpleOrientationSensor_add_OrientationChanged_Interface(Callback : access procedure (sender : Windows.Devices.Sensors.ISimpleOrientationSensor ; args : Windows.Devices.Sensors.ISimpleOrientationSensorOrientationChangedEventArgs)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_ISimpleOrientationSensor_add_OrientationChanged'access) with null record;
   function Invoke
   (
      This       : access TypedEventHandler_ISimpleOrientationSensor_add_OrientationChanged_Interface
      ; sender : Windows.Devices.Sensors.ISimpleOrientationSensor
      ; args : Windows.Devices.Sensors.ISimpleOrientationSensorOrientationChangedEventArgs
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_AsyncOperationCompletedHandler_IMagnetometer : aliased constant Windows.IID := (1189128040, 38469, 20902, (182, 167, 30, 95, 75, 64, 225, 243 ));
   
   type AsyncOperationCompletedHandler_IMagnetometer_Interface(Callback : access procedure (asyncInfo : Windows.Devices.Sensors.IAsyncOperation_IMagnetometer ; asyncStatus : Windows.Foundation.AsyncStatus)) is new Windows.IMulticastDelegate_Interface(IID_AsyncOperationCompletedHandler_IMagnetometer'access) with null record;
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_IMagnetometer_Interface
      ; asyncInfo : Windows.Devices.Sensors.IAsyncOperation_IMagnetometer
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_IMagnetometer_add_ReadingChanged : aliased constant Windows.IID := (4188068470, 50429, 20651, (152, 182, 191, 210, 109, 109, 61, 130 ));
   
   type TypedEventHandler_IMagnetometer_add_ReadingChanged_Interface(Callback : access procedure (sender : Windows.Devices.Sensors.IMagnetometer ; args : Windows.Devices.Sensors.IMagnetometerReadingChangedEventArgs)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_IMagnetometer_add_ReadingChanged'access) with null record;
   function Invoke
   (
      This       : access TypedEventHandler_IMagnetometer_add_ReadingChanged_Interface
      ; sender : Windows.Devices.Sensors.IMagnetometer
      ; args : Windows.Devices.Sensors.IMagnetometerReadingChangedEventArgs
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_AsyncOperationCompletedHandler_IActivitySensor : aliased constant Windows.IID := (4211447028, 37849, 23599, (184, 235, 144, 241, 233, 37, 143, 220 ));
   
   type AsyncOperationCompletedHandler_IActivitySensor_Interface(Callback : access procedure (asyncInfo : Windows.Devices.Sensors.IAsyncOperation_IActivitySensor ; asyncStatus : Windows.Foundation.AsyncStatus)) is new Windows.IMulticastDelegate_Interface(IID_AsyncOperationCompletedHandler_IActivitySensor'access) with null record;
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_IActivitySensor_Interface
      ; asyncInfo : Windows.Devices.Sensors.IAsyncOperation_IActivitySensor
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_AsyncOperationCompletedHandler_IActivitySensorReading : aliased constant Windows.IID := (2915339613, 45891, 23128, (132, 84, 110, 43, 194, 224, 71, 92 ));
   
   type AsyncOperationCompletedHandler_IActivitySensorReading_Interface(Callback : access procedure (asyncInfo : Windows.Devices.Sensors.IAsyncOperation_IActivitySensorReading ; asyncStatus : Windows.Foundation.AsyncStatus)) is new Windows.IMulticastDelegate_Interface(IID_AsyncOperationCompletedHandler_IActivitySensorReading'access) with null record;
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_IActivitySensorReading_Interface
      ; asyncInfo : Windows.Devices.Sensors.IAsyncOperation_IActivitySensorReading
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_IActivitySensor_add_ReadingChanged : aliased constant Windows.IID := (2780245505, 21612, 24507, (184, 71, 73, 32, 10, 170, 170, 197 ));
   
   type TypedEventHandler_IActivitySensor_add_ReadingChanged_Interface(Callback : access procedure (sender : Windows.Devices.Sensors.IActivitySensor ; args : Windows.Devices.Sensors.IActivitySensorReadingChangedEventArgs)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_IActivitySensor_add_ReadingChanged'access) with null record;
   function Invoke
   (
      This       : access TypedEventHandler_IActivitySensor_add_ReadingChanged_Interface
      ; sender : Windows.Devices.Sensors.IActivitySensor
      ; args : Windows.Devices.Sensors.IActivitySensorReadingChangedEventArgs
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_AsyncOperationCompletedHandler_IBarometer : aliased constant Windows.IID := (2707300822, 21607, 22796, (175, 225, 156, 129, 50, 220, 216, 164 ));
   
   type AsyncOperationCompletedHandler_IBarometer_Interface(Callback : access procedure (asyncInfo : Windows.Devices.Sensors.IAsyncOperation_IBarometer ; asyncStatus : Windows.Foundation.AsyncStatus)) is new Windows.IMulticastDelegate_Interface(IID_AsyncOperationCompletedHandler_IBarometer'access) with null record;
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_IBarometer_Interface
      ; asyncInfo : Windows.Devices.Sensors.IAsyncOperation_IBarometer
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_IBarometer_add_ReadingChanged : aliased constant Windows.IID := (3838506073, 53505, 23717, (164, 234, 222, 176, 145, 122, 226, 126 ));
   
   type TypedEventHandler_IBarometer_add_ReadingChanged_Interface(Callback : access procedure (sender : Windows.Devices.Sensors.IBarometer ; args : Windows.Devices.Sensors.IBarometerReadingChangedEventArgs)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_IBarometer_add_ReadingChanged'access) with null record;
   function Invoke
   (
      This       : access TypedEventHandler_IBarometer_add_ReadingChanged_Interface
      ; sender : Windows.Devices.Sensors.IBarometer
      ; args : Windows.Devices.Sensors.IBarometerReadingChangedEventArgs
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_AsyncOperationCompletedHandler_IPedometer : aliased constant Windows.IID := (2788015694, 20958, 23059, (186, 33, 231, 109, 243, 188, 19, 150 ));
   
   type AsyncOperationCompletedHandler_IPedometer_Interface(Callback : access procedure (asyncInfo : Windows.Devices.Sensors.IAsyncOperation_IPedometer ; asyncStatus : Windows.Foundation.AsyncStatus)) is new Windows.IMulticastDelegate_Interface(IID_AsyncOperationCompletedHandler_IPedometer'access) with null record;
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_IPedometer_Interface
      ; asyncInfo : Windows.Devices.Sensors.IAsyncOperation_IPedometer
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_IPedometer_add_ReadingChanged : aliased constant Windows.IID := (3704911507, 43733, 23356, (156, 141, 20, 11, 139, 194, 18, 43 ));
   
   type TypedEventHandler_IPedometer_add_ReadingChanged_Interface(Callback : access procedure (sender : Windows.Devices.Sensors.IPedometer ; args : Windows.Devices.Sensors.IPedometerReadingChangedEventArgs)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_IPedometer_add_ReadingChanged'access) with null record;
   function Invoke
   (
      This       : access TypedEventHandler_IPedometer_add_ReadingChanged_Interface
      ; sender : Windows.Devices.Sensors.IPedometer
      ; args : Windows.Devices.Sensors.IPedometerReadingChangedEventArgs
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_IProximitySensor_add_ReadingChanged : aliased constant Windows.IID := (2675843627, 35114, 24168, (176, 138, 16, 56, 75, 95, 146, 185 ));
   
   type TypedEventHandler_IProximitySensor_add_ReadingChanged_Interface(Callback : access procedure (sender : Windows.Devices.Sensors.IProximitySensor ; args : Windows.Devices.Sensors.IProximitySensorReadingChangedEventArgs)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_IProximitySensor_add_ReadingChanged'access) with null record;
   function Invoke
   (
      This       : access TypedEventHandler_IProximitySensor_add_ReadingChanged_Interface
      ; sender : Windows.Devices.Sensors.IProximitySensor
      ; args : Windows.Devices.Sensors.IProximitySensorReadingChangedEventArgs
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_IAltimeter_add_ReadingChanged : aliased constant Windows.IID := (3614824089, 40308, 21619, (156, 27, 213, 26, 137, 219, 102, 66 ));
   
   type TypedEventHandler_IAltimeter_add_ReadingChanged_Interface(Callback : access procedure (sender : Windows.Devices.Sensors.IAltimeter ; args : Windows.Devices.Sensors.IAltimeterReadingChangedEventArgs)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_IAltimeter_add_ReadingChanged'access) with null record;
   function Invoke
   (
      This       : access TypedEventHandler_IAltimeter_add_ReadingChanged_Interface
      ; sender : Windows.Devices.Sensors.IAltimeter
      ; args : Windows.Devices.Sensors.IAltimeterReadingChangedEventArgs
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   -- Classes
   ------------------------------------------------------------------------
   
   subtype SensorDataThresholdTriggerDetails is Windows.Devices.Sensors.ISensorDataThresholdTriggerDetails;
   subtype Accelerometer is Windows.Devices.Sensors.IAccelerometer;
   subtype AccelerometerReading is Windows.Devices.Sensors.IAccelerometerReading;
   subtype AccelerometerReadingChangedEventArgs is Windows.Devices.Sensors.IAccelerometerReadingChangedEventArgs;
   subtype AccelerometerShakenEventArgs is Windows.Devices.Sensors.IAccelerometerShakenEventArgs;
   subtype Inclinometer is Windows.Devices.Sensors.IInclinometer;
   subtype InclinometerReading is Windows.Devices.Sensors.IInclinometerReading;
   subtype InclinometerReadingChangedEventArgs is Windows.Devices.Sensors.IInclinometerReadingChangedEventArgs;
   subtype Gyrometer is Windows.Devices.Sensors.IGyrometer;
   subtype GyrometerReading is Windows.Devices.Sensors.IGyrometerReading;
   subtype GyrometerReadingChangedEventArgs is Windows.Devices.Sensors.IGyrometerReadingChangedEventArgs;
   subtype Compass is Windows.Devices.Sensors.ICompass;
   subtype CompassReading is Windows.Devices.Sensors.ICompassReading;
   subtype CompassReadingChangedEventArgs is Windows.Devices.Sensors.ICompassReadingChangedEventArgs;
   subtype LightSensor is Windows.Devices.Sensors.ILightSensor;
   subtype LightSensorReading is Windows.Devices.Sensors.ILightSensorReading;
   subtype LightSensorReadingChangedEventArgs is Windows.Devices.Sensors.ILightSensorReadingChangedEventArgs;
   subtype SensorRotationMatrix is Windows.Devices.Sensors.ISensorRotationMatrix;
   subtype SensorQuaternion is Windows.Devices.Sensors.ISensorQuaternion;
   subtype OrientationSensor is Windows.Devices.Sensors.IOrientationSensor;
   subtype OrientationSensorReading is Windows.Devices.Sensors.IOrientationSensorReading;
   subtype OrientationSensorReadingChangedEventArgs is Windows.Devices.Sensors.IOrientationSensorReadingChangedEventArgs;
   subtype SimpleOrientationSensor is Windows.Devices.Sensors.ISimpleOrientationSensor;
   subtype SimpleOrientationSensorOrientationChangedEventArgs is Windows.Devices.Sensors.ISimpleOrientationSensorOrientationChangedEventArgs;
   subtype Magnetometer is Windows.Devices.Sensors.IMagnetometer;
   subtype MagnetometerReading is Windows.Devices.Sensors.IMagnetometerReading;
   subtype MagnetometerReadingChangedEventArgs is Windows.Devices.Sensors.IMagnetometerReadingChangedEventArgs;
   subtype ActivitySensor is Windows.Devices.Sensors.IActivitySensor;
   subtype ActivitySensorReading is Windows.Devices.Sensors.IActivitySensorReading;
   subtype ActivitySensorReadingChangedEventArgs is Windows.Devices.Sensors.IActivitySensorReadingChangedEventArgs;
   subtype ActivitySensorReadingChangeReport is Windows.Devices.Sensors.IActivitySensorReadingChangeReport;
   subtype ActivitySensorTriggerDetails is Windows.Devices.Sensors.IActivitySensorTriggerDetails;
   subtype Barometer is Windows.Devices.Sensors.IBarometer;
   subtype BarometerReading is Windows.Devices.Sensors.IBarometerReading;
   subtype BarometerReadingChangedEventArgs is Windows.Devices.Sensors.IBarometerReadingChangedEventArgs;
   subtype PedometerReading is Windows.Devices.Sensors.IPedometerReading;
   subtype Pedometer is Windows.Devices.Sensors.IPedometer;
   subtype PedometerReadingChangedEventArgs is Windows.Devices.Sensors.IPedometerReadingChangedEventArgs;
   subtype PedometerDataThreshold is Windows.Devices.Sensors.ISensorDataThreshold;
   function Create
   (
      sensor : Windows.Devices.Sensors.IPedometer
      ; stepGoal : Windows.Int32
   )
   return Windows.Devices.Sensors.ISensorDataThreshold;
   
   subtype ProximitySensor is Windows.Devices.Sensors.IProximitySensor;
   subtype ProximitySensorReading is Windows.Devices.Sensors.IProximitySensorReading;
   subtype ProximitySensorReadingChangedEventArgs is Windows.Devices.Sensors.IProximitySensorReadingChangedEventArgs;
   subtype ProximitySensorDisplayOnOffController is Windows.Foundation.IClosable;
   subtype ProximitySensorDataThreshold is Windows.Devices.Sensors.ISensorDataThreshold;
   function Create
   (
      sensor : Windows.Devices.Sensors.IProximitySensor
   )
   return Windows.Devices.Sensors.ISensorDataThreshold;
   
   subtype Altimeter is Windows.Devices.Sensors.IAltimeter;
   subtype AltimeterReading is Windows.Devices.Sensors.IAltimeterReading;
   subtype AltimeterReadingChangedEventArgs is Windows.Devices.Sensors.IAltimeterReadingChangedEventArgs;
   
   ------------------------------------------------------------------------
   -- Static Procedures/functions
   ------------------------------------------------------------------------
   
   function GetDefaultWithAccelerometerReadingType
   (
      readingType : Windows.Devices.Sensors.AccelerometerReadingType
   )
   return Windows.Devices.Sensors.IAccelerometer;
   
   function FromIdAsync
   (
      deviceId : Windows.String
   )
   return Windows.Devices.Sensors.IAsyncOperation_IAccelerometer;
   
   function GetDeviceSelector
   (
      readingType : Windows.Devices.Sensors.AccelerometerReadingType
   )
   return Windows.String;
   
   function GetDefault
   return Windows.Devices.Sensors.IAccelerometer;
   
   function GetDefault
   return Windows.Devices.Sensors.IInclinometer;
   
   function GetDeviceSelector
   (
      readingType : Windows.Devices.Sensors.SensorReadingType
   )
   return Windows.String;
   
   function FromIdAsync
   (
      deviceId : Windows.String
   )
   return Windows.Devices.Sensors.IAsyncOperation_IInclinometer;
   
   function GetDefaultWithSensorReadingType
   (
      sensorReadingtype : Windows.Devices.Sensors.SensorReadingType
   )
   return Windows.Devices.Sensors.IInclinometer;
   
   function GetDefaultForRelativeReadings
   return Windows.Devices.Sensors.IInclinometer;
   
   function GetDeviceSelector
   return Windows.String;
   
   function FromIdAsync
   (
      deviceId : Windows.String
   )
   return Windows.Devices.Sensors.IAsyncOperation_IGyrometer;
   
   function GetDefault
   return Windows.Devices.Sensors.IGyrometer;
   
   function GetDefault
   return Windows.Devices.Sensors.ICompass;
   
   function GetDeviceSelector_ICompass
   return Windows.String;
   
   function FromIdAsync
   (
      deviceId : Windows.String
   )
   return Windows.Devices.Sensors.IAsyncOperation_ICompass;
   
   function GetDefault
   return Windows.Devices.Sensors.ILightSensor;
   
   function GetDeviceSelector_ILightSensor
   return Windows.String;
   
   function FromIdAsync
   (
      deviceId : Windows.String
   )
   return Windows.Devices.Sensors.IAsyncOperation_ILightSensor;
   
   function GetDefaultForRelativeReadings
   return Windows.Devices.Sensors.IOrientationSensor;
   
   function GetDefault
   return Windows.Devices.Sensors.IOrientationSensor;
   
   function GetDeviceSelector_IOrientationSensor
   (
      readingType : Windows.Devices.Sensors.SensorReadingType
   )
   return Windows.String;
   
   function GetDeviceSelectorWithSensorReadingTypeAndSensorOptimizationGoal
   (
      readingType : Windows.Devices.Sensors.SensorReadingType
      ; optimizationGoal : Windows.Devices.Sensors.SensorOptimizationGoal
   )
   return Windows.String;
   
   function FromIdAsync
   (
      deviceId : Windows.String
   )
   return Windows.Devices.Sensors.IAsyncOperation_IOrientationSensor;
   
   function GetDefaultWithSensorReadingType
   (
      sensorReadingtype : Windows.Devices.Sensors.SensorReadingType
   )
   return Windows.Devices.Sensors.IOrientationSensor;
   
   function GetDefaultWithSensorReadingTypeAndSensorOptimizationGoal
   (
      sensorReadingType : Windows.Devices.Sensors.SensorReadingType
      ; optimizationGoal : Windows.Devices.Sensors.SensorOptimizationGoal
   )
   return Windows.Devices.Sensors.IOrientationSensor;
   
   function GetDefault
   return Windows.Devices.Sensors.ISimpleOrientationSensor;
   
   function GetDefault
   return Windows.Devices.Sensors.IMagnetometer;
   
   function GetDeviceSelector_IMagnetometer
   return Windows.String;
   
   function FromIdAsync
   (
      deviceId : Windows.String
   )
   return Windows.Devices.Sensors.IAsyncOperation_IMagnetometer;
   
   function GetDefaultAsync
   return Windows.Devices.Sensors.IAsyncOperation_IActivitySensor;
   
   function GetDeviceSelector_IActivitySensor
   return Windows.String;
   
   function FromIdAsync
   (
      deviceId : Windows.String
   )
   return Windows.Devices.Sensors.IAsyncOperation_IActivitySensor;
   
   function GetSystemHistoryAsync
   (
      fromTime : Windows.Foundation.DateTime
   )
   return Windows.Address;
   
   function GetSystemHistoryWithDurationAsync
   (
      fromTime : Windows.Foundation.DateTime
      ; duration : Windows.Foundation.TimeSpan
   )
   return Windows.Address;
   
   function GetDefault
   return Windows.Devices.Sensors.IBarometer;
   
   function FromIdAsync
   (
      deviceId : Windows.String
   )
   return Windows.Devices.Sensors.IAsyncOperation_IBarometer;
   
   function GetDeviceSelector_IBarometer
   return Windows.String;
   
   function FromIdAsync
   (
      deviceId : Windows.String
   )
   return Windows.Devices.Sensors.IAsyncOperation_IPedometer;
   
   function GetDefaultAsync
   return Windows.Devices.Sensors.IAsyncOperation_IPedometer;
   
   function GetDeviceSelector_IPedometer
   return Windows.String;
   
   function GetSystemHistoryAsync_IPedometer
   (
      fromTime : Windows.Foundation.DateTime
   )
   return Windows.Address;
   
   function GetSystemHistoryWithDurationAsync_IPedometer
   (
      fromTime : Windows.Foundation.DateTime
      ; duration : Windows.Foundation.TimeSpan
   )
   return Windows.Address;
   
   function GetReadingsFromTriggerDetails
   (
      triggerDetails : Windows.Devices.Sensors.ISensorDataThresholdTriggerDetails
   )
   return Windows.Devices.Sensors.IVectorView_IPedometerReading;
   
   function GetReadingsFromTriggerDetails
   (
      triggerDetails : Windows.Devices.Sensors.ISensorDataThresholdTriggerDetails
   )
   return Windows.Devices.Sensors.IVectorView_IProximitySensorReading;
   
   function GetDeviceSelector_IProximitySensor
   return Windows.String;
   
   function FromId
   (
      sensorId : Windows.String
   )
   return Windows.Devices.Sensors.IProximitySensor;
   
   function GetDefault
   return Windows.Devices.Sensors.IAltimeter;
   
end;
