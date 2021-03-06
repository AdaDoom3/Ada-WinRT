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
with Windows.Foundation.Collections;
with Windows.Foundation;
package Windows.Globalization.DateTimeFormatting is

   pragma preelaborate;
   
   ------------------------------------------------------------------------
   -- Enums
   ------------------------------------------------------------------------
   
   type YearFormat is (
      None,
      Default,
      Abbreviated,
      Full
   );
   for YearFormat use (
      None => 0,
      Default => 1,
      Abbreviated => 2,
      Full => 3
   );
   for YearFormat'Size use 32;
   
   type YearFormat_Ptr is access YearFormat;
   
   type MonthFormat is (
      None,
      Default,
      Abbreviated,
      Full,
      Numeric
   );
   for MonthFormat use (
      None => 0,
      Default => 1,
      Abbreviated => 2,
      Full => 3,
      Numeric => 4
   );
   for MonthFormat'Size use 32;
   
   type MonthFormat_Ptr is access MonthFormat;
   
   type DayOfWeekFormat is (
      None,
      Default,
      Abbreviated,
      Full
   );
   for DayOfWeekFormat use (
      None => 0,
      Default => 1,
      Abbreviated => 2,
      Full => 3
   );
   for DayOfWeekFormat'Size use 32;
   
   type DayOfWeekFormat_Ptr is access DayOfWeekFormat;
   
   type DayFormat is (
      None,
      Default
   );
   for DayFormat use (
      None => 0,
      Default => 1
   );
   for DayFormat'Size use 32;
   
   type DayFormat_Ptr is access DayFormat;
   
   type HourFormat is (
      None,
      Default
   );
   for HourFormat use (
      None => 0,
      Default => 1
   );
   for HourFormat'Size use 32;
   
   type HourFormat_Ptr is access HourFormat;
   
   type MinuteFormat is (
      None,
      Default
   );
   for MinuteFormat use (
      None => 0,
      Default => 1
   );
   for MinuteFormat'Size use 32;
   
   type MinuteFormat_Ptr is access MinuteFormat;
   
   type SecondFormat is (
      None,
      Default
   );
   for SecondFormat use (
      None => 0,
      Default => 1
   );
   for SecondFormat'Size use 32;
   
   type SecondFormat_Ptr is access SecondFormat;
   
   ------------------------------------------------------------------------
   -- Forward Declaration - Interfaces
   ------------------------------------------------------------------------
   
   type IDateTimeFormatter_Interface;
   type IDateTimeFormatter is access all IDateTimeFormatter_Interface'Class;
   type IDateTimeFormatter_Ptr is access all IDateTimeFormatter;
   type IDateTimeFormatterFactory_Interface;
   type IDateTimeFormatterFactory is access all IDateTimeFormatterFactory_Interface'Class;
   type IDateTimeFormatterFactory_Ptr is access all IDateTimeFormatterFactory;
   type IDateTimeFormatterStatics_Interface;
   type IDateTimeFormatterStatics is access all IDateTimeFormatterStatics_Interface'Class;
   type IDateTimeFormatterStatics_Ptr is access all IDateTimeFormatterStatics;
   type IDateTimeFormatter2_Interface;
   type IDateTimeFormatter2 is access all IDateTimeFormatter2_Interface'Class;
   type IDateTimeFormatter2_Ptr is access all IDateTimeFormatter2;
   
   ------------------------------------------------------------------------
   -- Interfaces
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   
   IID_IDateTimeFormatter : aliased constant Windows.IID := (2515454480, 29664, 20043, (161, 131, 61, 106, 208, 186, 53, 236 ));
   
   type IDateTimeFormatter_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Languages
   (
      This       : access IDateTimeFormatter_Interface
      ; RetVal : access Windows.Foundation.Collections.IVectorView_String -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_GeographicRegion
   (
      This       : access IDateTimeFormatter_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Calendar
   (
      This       : access IDateTimeFormatter_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Clock
   (
      This       : access IDateTimeFormatter_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_NumeralSystem
   (
      This       : access IDateTimeFormatter_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function put_NumeralSystem
   (
      This       : access IDateTimeFormatter_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Patterns
   (
      This       : access IDateTimeFormatter_Interface
      ; RetVal : access Windows.Foundation.Collections.IVectorView_String -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_Template
   (
      This       : access IDateTimeFormatter_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function Format
   (
      This       : access IDateTimeFormatter_Interface
      ; value : Windows.Foundation.DateTime
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_IncludeYear
   (
      This       : access IDateTimeFormatter_Interface
      ; RetVal : access Windows.Globalization.DateTimeFormatting.YearFormat
   )
   return Windows.HRESULT is abstract;
   
   function get_IncludeMonth
   (
      This       : access IDateTimeFormatter_Interface
      ; RetVal : access Windows.Globalization.DateTimeFormatting.MonthFormat
   )
   return Windows.HRESULT is abstract;
   
   function get_IncludeDayOfWeek
   (
      This       : access IDateTimeFormatter_Interface
      ; RetVal : access Windows.Globalization.DateTimeFormatting.DayOfWeekFormat
   )
   return Windows.HRESULT is abstract;
   
   function get_IncludeDay
   (
      This       : access IDateTimeFormatter_Interface
      ; RetVal : access Windows.Globalization.DateTimeFormatting.DayFormat
   )
   return Windows.HRESULT is abstract;
   
   function get_IncludeHour
   (
      This       : access IDateTimeFormatter_Interface
      ; RetVal : access Windows.Globalization.DateTimeFormatting.HourFormat
   )
   return Windows.HRESULT is abstract;
   
   function get_IncludeMinute
   (
      This       : access IDateTimeFormatter_Interface
      ; RetVal : access Windows.Globalization.DateTimeFormatting.MinuteFormat
   )
   return Windows.HRESULT is abstract;
   
   function get_IncludeSecond
   (
      This       : access IDateTimeFormatter_Interface
      ; RetVal : access Windows.Globalization.DateTimeFormatting.SecondFormat
   )
   return Windows.HRESULT is abstract;
   
   function get_ResolvedLanguage
   (
      This       : access IDateTimeFormatter_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_ResolvedGeographicRegion
   (
      This       : access IDateTimeFormatter_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IDateTimeFormatterFactory : aliased constant Windows.IID := (3968698963, 6702, 16685, (136, 21, 59, 116, 95, 177, 162, 160 ));
   
   type IDateTimeFormatterFactory_Interface is interface and Windows.IInspectable_Interface;
   
   function CreateDateTimeFormatter
   (
      This       : access IDateTimeFormatterFactory_Interface
      ; formatTemplate : Windows.String
      ; RetVal : access Windows.Globalization.DateTimeFormatting.IDateTimeFormatter
   )
   return Windows.HRESULT is abstract;
   
   function CreateDateTimeFormatterLanguages
   (
      This       : access IDateTimeFormatterFactory_Interface
      ; formatTemplate : Windows.String
      ; languages : Windows.Foundation.Collections.IIterable_String
      ; RetVal : access Windows.Globalization.DateTimeFormatting.IDateTimeFormatter
   )
   return Windows.HRESULT is abstract;
   
   function CreateDateTimeFormatterContext
   (
      This       : access IDateTimeFormatterFactory_Interface
      ; formatTemplate : Windows.String
      ; languages : Windows.Foundation.Collections.IIterable_String
      ; geographicRegion : Windows.String
      ; calendar : Windows.String
      ; clock : Windows.String
      ; RetVal : access Windows.Globalization.DateTimeFormatting.IDateTimeFormatter
   )
   return Windows.HRESULT is abstract;
   
   function CreateDateTimeFormatterDate
   (
      This       : access IDateTimeFormatterFactory_Interface
      ; yearFormat : Windows.Globalization.DateTimeFormatting.YearFormat
      ; monthFormat : Windows.Globalization.DateTimeFormatting.MonthFormat
      ; dayFormat : Windows.Globalization.DateTimeFormatting.DayFormat
      ; dayOfWeekFormat : Windows.Globalization.DateTimeFormatting.DayOfWeekFormat
      ; RetVal : access Windows.Globalization.DateTimeFormatting.IDateTimeFormatter
   )
   return Windows.HRESULT is abstract;
   
   function CreateDateTimeFormatterTime
   (
      This       : access IDateTimeFormatterFactory_Interface
      ; hourFormat : Windows.Globalization.DateTimeFormatting.HourFormat
      ; minuteFormat : Windows.Globalization.DateTimeFormatting.MinuteFormat
      ; secondFormat : Windows.Globalization.DateTimeFormatting.SecondFormat
      ; RetVal : access Windows.Globalization.DateTimeFormatting.IDateTimeFormatter
   )
   return Windows.HRESULT is abstract;
   
   function CreateDateTimeFormatterDateTimeLanguages
   (
      This       : access IDateTimeFormatterFactory_Interface
      ; yearFormat : Windows.Globalization.DateTimeFormatting.YearFormat
      ; monthFormat : Windows.Globalization.DateTimeFormatting.MonthFormat
      ; dayFormat : Windows.Globalization.DateTimeFormatting.DayFormat
      ; dayOfWeekFormat : Windows.Globalization.DateTimeFormatting.DayOfWeekFormat
      ; hourFormat : Windows.Globalization.DateTimeFormatting.HourFormat
      ; minuteFormat : Windows.Globalization.DateTimeFormatting.MinuteFormat
      ; secondFormat : Windows.Globalization.DateTimeFormatting.SecondFormat
      ; languages : Windows.Foundation.Collections.IIterable_String
      ; RetVal : access Windows.Globalization.DateTimeFormatting.IDateTimeFormatter
   )
   return Windows.HRESULT is abstract;
   
   function CreateDateTimeFormatterDateTimeContext
   (
      This       : access IDateTimeFormatterFactory_Interface
      ; yearFormat : Windows.Globalization.DateTimeFormatting.YearFormat
      ; monthFormat : Windows.Globalization.DateTimeFormatting.MonthFormat
      ; dayFormat : Windows.Globalization.DateTimeFormatting.DayFormat
      ; dayOfWeekFormat : Windows.Globalization.DateTimeFormatting.DayOfWeekFormat
      ; hourFormat : Windows.Globalization.DateTimeFormatting.HourFormat
      ; minuteFormat : Windows.Globalization.DateTimeFormatting.MinuteFormat
      ; secondFormat : Windows.Globalization.DateTimeFormatting.SecondFormat
      ; languages : Windows.Foundation.Collections.IIterable_String
      ; geographicRegion : Windows.String
      ; calendar : Windows.String
      ; clock : Windows.String
      ; RetVal : access Windows.Globalization.DateTimeFormatting.IDateTimeFormatter
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IDateTimeFormatterStatics : aliased constant Windows.IID := (3217942464, 57164, 18990, (144, 18, 244, 125, 175, 63, 18, 18 ));
   
   type IDateTimeFormatterStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function get_LongDate
   (
      This       : access IDateTimeFormatterStatics_Interface
      ; RetVal : access Windows.Globalization.DateTimeFormatting.IDateTimeFormatter
   )
   return Windows.HRESULT is abstract;
   
   function get_LongTime
   (
      This       : access IDateTimeFormatterStatics_Interface
      ; RetVal : access Windows.Globalization.DateTimeFormatting.IDateTimeFormatter
   )
   return Windows.HRESULT is abstract;
   
   function get_ShortDate
   (
      This       : access IDateTimeFormatterStatics_Interface
      ; RetVal : access Windows.Globalization.DateTimeFormatting.IDateTimeFormatter
   )
   return Windows.HRESULT is abstract;
   
   function get_ShortTime
   (
      This       : access IDateTimeFormatterStatics_Interface
      ; RetVal : access Windows.Globalization.DateTimeFormatting.IDateTimeFormatter
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IDateTimeFormatter2 : aliased constant Windows.IID := (667490950, 48554, 20432, (158, 54, 103, 29, 90, 165, 238, 3 ));
   
   type IDateTimeFormatter2_Interface is interface and Windows.IInspectable_Interface;
   
   function FormatUsingTimeZone
   (
      This       : access IDateTimeFormatter2_Interface
      ; datetime : Windows.Foundation.DateTime
      ; timeZoneId : Windows.String
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   -- Classes
   ------------------------------------------------------------------------
   
   subtype DateTimeFormatter is Windows.Globalization.DateTimeFormatting.IDateTimeFormatter;
   function CreateDateTimeFormatter
   (
      formatTemplate : Windows.String
   )
   return Windows.Globalization.DateTimeFormatting.IDateTimeFormatter;
   
   function CreateDateTimeFormatterLanguages
   (
      formatTemplate : Windows.String
      ; languages : Windows.Foundation.Collections.IIterable_String
   )
   return Windows.Globalization.DateTimeFormatting.IDateTimeFormatter;
   
   function CreateDateTimeFormatterContext
   (
      formatTemplate : Windows.String
      ; languages : Windows.Foundation.Collections.IIterable_String
      ; geographicRegion : Windows.String
      ; calendar : Windows.String
      ; clock : Windows.String
   )
   return Windows.Globalization.DateTimeFormatting.IDateTimeFormatter;
   
   function CreateDateTimeFormatterDate
   (
      yearFormat : Windows.Globalization.DateTimeFormatting.YearFormat
      ; monthFormat : Windows.Globalization.DateTimeFormatting.MonthFormat
      ; dayFormat : Windows.Globalization.DateTimeFormatting.DayFormat
      ; dayOfWeekFormat : Windows.Globalization.DateTimeFormatting.DayOfWeekFormat
   )
   return Windows.Globalization.DateTimeFormatting.IDateTimeFormatter;
   
   function CreateDateTimeFormatterTime
   (
      hourFormat : Windows.Globalization.DateTimeFormatting.HourFormat
      ; minuteFormat : Windows.Globalization.DateTimeFormatting.MinuteFormat
      ; secondFormat : Windows.Globalization.DateTimeFormatting.SecondFormat
   )
   return Windows.Globalization.DateTimeFormatting.IDateTimeFormatter;
   
   function CreateDateTimeFormatterDateTimeLanguages
   (
      yearFormat : Windows.Globalization.DateTimeFormatting.YearFormat
      ; monthFormat : Windows.Globalization.DateTimeFormatting.MonthFormat
      ; dayFormat : Windows.Globalization.DateTimeFormatting.DayFormat
      ; dayOfWeekFormat : Windows.Globalization.DateTimeFormatting.DayOfWeekFormat
      ; hourFormat : Windows.Globalization.DateTimeFormatting.HourFormat
      ; minuteFormat : Windows.Globalization.DateTimeFormatting.MinuteFormat
      ; secondFormat : Windows.Globalization.DateTimeFormatting.SecondFormat
      ; languages : Windows.Foundation.Collections.IIterable_String
   )
   return Windows.Globalization.DateTimeFormatting.IDateTimeFormatter;
   
   function CreateDateTimeFormatterDateTimeContext
   (
      yearFormat : Windows.Globalization.DateTimeFormatting.YearFormat
      ; monthFormat : Windows.Globalization.DateTimeFormatting.MonthFormat
      ; dayFormat : Windows.Globalization.DateTimeFormatting.DayFormat
      ; dayOfWeekFormat : Windows.Globalization.DateTimeFormatting.DayOfWeekFormat
      ; hourFormat : Windows.Globalization.DateTimeFormatting.HourFormat
      ; minuteFormat : Windows.Globalization.DateTimeFormatting.MinuteFormat
      ; secondFormat : Windows.Globalization.DateTimeFormatting.SecondFormat
      ; languages : Windows.Foundation.Collections.IIterable_String
      ; geographicRegion : Windows.String
      ; calendar : Windows.String
      ; clock : Windows.String
   )
   return Windows.Globalization.DateTimeFormatting.IDateTimeFormatter;
   
   
   ------------------------------------------------------------------------
   -- Static Procedures/functions
   ------------------------------------------------------------------------
   
   function get_LongDate
   return Windows.Globalization.DateTimeFormatting.IDateTimeFormatter;
   
   function get_LongTime
   return Windows.Globalization.DateTimeFormatting.IDateTimeFormatter;
   
   function get_ShortDate
   return Windows.Globalization.DateTimeFormatting.IDateTimeFormatter;
   
   function get_ShortTime
   return Windows.Globalization.DateTimeFormatting.IDateTimeFormatter;
   
end;
