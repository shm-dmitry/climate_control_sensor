<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE eagle SYSTEM "eagle.dtd">
<eagle version="9.6.2">
<drawing>
<settings>
<setting alwaysvectorfont="no"/>
<setting verticaltext="up"/>
</settings>
<grid distance="0.1" unitdist="inch" unit="inch" style="lines" multiple="1" display="no" altdistance="0.01" altunitdist="inch" altunit="inch"/>
<layers>
<layer number="1" name="Top" color="4" fill="1" visible="no" active="no"/>
<layer number="2" name="Route2" color="1" fill="3" visible="no" active="no"/>
<layer number="3" name="Route3" color="4" fill="3" visible="no" active="no"/>
<layer number="4" name="Route4" color="1" fill="4" visible="no" active="no"/>
<layer number="5" name="Route5" color="4" fill="4" visible="no" active="no"/>
<layer number="6" name="Route6" color="1" fill="8" visible="no" active="no"/>
<layer number="7" name="Route7" color="4" fill="8" visible="no" active="no"/>
<layer number="8" name="Route8" color="1" fill="2" visible="no" active="no"/>
<layer number="9" name="Route9" color="4" fill="2" visible="no" active="no"/>
<layer number="10" name="Route10" color="1" fill="7" visible="no" active="no"/>
<layer number="11" name="Route11" color="4" fill="7" visible="no" active="no"/>
<layer number="12" name="Route12" color="1" fill="5" visible="no" active="no"/>
<layer number="13" name="Route13" color="4" fill="5" visible="no" active="no"/>
<layer number="14" name="Route14" color="1" fill="6" visible="no" active="no"/>
<layer number="15" name="Route15" color="4" fill="6" visible="no" active="no"/>
<layer number="16" name="Bottom" color="1" fill="1" visible="no" active="no"/>
<layer number="17" name="Pads" color="2" fill="1" visible="no" active="no"/>
<layer number="18" name="Vias" color="2" fill="1" visible="no" active="no"/>
<layer number="19" name="Unrouted" color="6" fill="1" visible="no" active="no"/>
<layer number="20" name="Dimension" color="24" fill="1" visible="no" active="no"/>
<layer number="21" name="tPlace" color="7" fill="1" visible="no" active="no"/>
<layer number="22" name="bPlace" color="7" fill="1" visible="no" active="no"/>
<layer number="23" name="tOrigins" color="15" fill="1" visible="no" active="no"/>
<layer number="24" name="bOrigins" color="15" fill="1" visible="no" active="no"/>
<layer number="25" name="tNames" color="7" fill="1" visible="no" active="no"/>
<layer number="26" name="bNames" color="7" fill="1" visible="no" active="no"/>
<layer number="27" name="tValues" color="7" fill="1" visible="no" active="no"/>
<layer number="28" name="bValues" color="7" fill="1" visible="no" active="no"/>
<layer number="29" name="tStop" color="7" fill="3" visible="no" active="no"/>
<layer number="30" name="bStop" color="7" fill="6" visible="no" active="no"/>
<layer number="31" name="tCream" color="7" fill="4" visible="no" active="no"/>
<layer number="32" name="bCream" color="7" fill="5" visible="no" active="no"/>
<layer number="33" name="tFinish" color="6" fill="3" visible="no" active="no"/>
<layer number="34" name="bFinish" color="6" fill="6" visible="no" active="no"/>
<layer number="35" name="tGlue" color="7" fill="4" visible="no" active="no"/>
<layer number="36" name="bGlue" color="7" fill="5" visible="no" active="no"/>
<layer number="37" name="tTest" color="7" fill="1" visible="no" active="no"/>
<layer number="38" name="bTest" color="7" fill="1" visible="no" active="no"/>
<layer number="39" name="tKeepout" color="4" fill="11" visible="no" active="no"/>
<layer number="40" name="bKeepout" color="1" fill="11" visible="no" active="no"/>
<layer number="41" name="tRestrict" color="4" fill="10" visible="no" active="no"/>
<layer number="42" name="bRestrict" color="1" fill="10" visible="no" active="no"/>
<layer number="43" name="vRestrict" color="2" fill="10" visible="no" active="no"/>
<layer number="44" name="Drills" color="7" fill="1" visible="no" active="no"/>
<layer number="45" name="Holes" color="7" fill="1" visible="no" active="no"/>
<layer number="46" name="Milling" color="3" fill="1" visible="no" active="no"/>
<layer number="47" name="Measures" color="7" fill="1" visible="no" active="no"/>
<layer number="48" name="Document" color="7" fill="1" visible="no" active="no"/>
<layer number="49" name="Reference" color="7" fill="1" visible="no" active="no"/>
<layer number="51" name="tDocu" color="7" fill="1" visible="no" active="no"/>
<layer number="52" name="bDocu" color="7" fill="1" visible="no" active="no"/>
<layer number="88" name="SimResults" color="9" fill="1" visible="yes" active="yes"/>
<layer number="89" name="SimProbes" color="9" fill="1" visible="yes" active="yes"/>
<layer number="90" name="Modules" color="5" fill="1" visible="yes" active="yes"/>
<layer number="91" name="Nets" color="2" fill="1" visible="yes" active="yes"/>
<layer number="92" name="Busses" color="1" fill="1" visible="yes" active="yes"/>
<layer number="93" name="Pins" color="2" fill="1" visible="no" active="yes"/>
<layer number="94" name="Symbols" color="4" fill="1" visible="yes" active="yes"/>
<layer number="95" name="Names" color="7" fill="1" visible="yes" active="yes"/>
<layer number="96" name="Values" color="7" fill="1" visible="yes" active="yes"/>
<layer number="97" name="Info" color="7" fill="1" visible="yes" active="yes"/>
<layer number="98" name="Guide" color="6" fill="1" visible="yes" active="yes"/>
<layer number="99" name="SpiceOrder" color="7" fill="1" visible="yes" active="yes"/>
<layer number="101" name="Hidden" color="15" fill="1" visible="yes" active="yes"/>
<layer number="102" name="Changes" color="12" fill="1" visible="yes" active="yes"/>
</layers>
<schematic xreflabel="%F%N/%S.%C%R" xrefpart="/%S.%C%R">
<libraries>
<library name="my_devices">
<packages>
<package name="ACDC">
<wire x1="-33" y1="15" x2="33" y2="15" width="0.127" layer="21"/>
<wire x1="33" y1="15" x2="33" y2="-15" width="0.127" layer="21"/>
<wire x1="33" y1="-15" x2="-33" y2="-15" width="0.127" layer="21"/>
<wire x1="-33" y1="-15" x2="-33" y2="15" width="0.127" layer="21"/>
<circle x="-30" y="12" radius="2.828425" width="0.127" layer="21"/>
<circle x="30" y="12" radius="2.828425" width="0.127" layer="21"/>
<circle x="30" y="-12" radius="2.828425" width="0.127" layer="21"/>
<circle x="-30" y="-12" radius="2.828425" width="0.127" layer="21"/>
<pad name="220V_L" x="-30" y="2" drill="0.6" shape="square"/>
<pad name="220V_N" x="-30" y="-5" drill="0.6" shape="square"/>
<pad name="GND" x="29" y="0" drill="0.6" shape="square"/>
<pad name="+5V" x="29" y="-3" drill="0.6" shape="square"/>
<text x="-27" y="-2" size="1.27" layer="21">220V</text>
<text x="24" y="-4" size="1.27" layer="21">+5V</text>
<text x="24" y="0" size="1.27" layer="21">GND</text>
</package>
<package name="ESP32">
<pad name="IO26" x="-12.7" y="0" drill="0.8" shape="square"/>
<pad name="IO5" x="12.7" y="0" drill="0.8" shape="square"/>
<pad name="IO25" x="-12.7" y="2.54" drill="0.8" shape="square"/>
<pad name="IO33" x="-12.7" y="5.08" drill="0.8" shape="square"/>
<pad name="IO32" x="-12.7" y="7.62" drill="0.8" shape="square"/>
<pad name="IO35" x="-12.7" y="10.16" drill="0.8" shape="square"/>
<pad name="IO34" x="-12.7" y="12.7" drill="0.8" shape="square"/>
<pad name="SVN" x="-12.7" y="15.24" drill="0.8" shape="square"/>
<pad name="SVP" x="-12.7" y="17.78" drill="0.8" shape="square"/>
<pad name="EN" x="-12.7" y="20.32" drill="0.8" shape="square"/>
<pad name="3V3" x="-12.7" y="22.86" drill="0.8" shape="square"/>
<pad name="IO27" x="-12.7" y="-2.54" drill="0.8" shape="square"/>
<pad name="IO14" x="-12.7" y="-5.08" drill="0.8" shape="square"/>
<pad name="IO12" x="-12.7" y="-7.62" drill="0.8" shape="square"/>
<pad name="GND_2" x="-12.7" y="-10.16" drill="0.8" shape="square"/>
<pad name="IO13" x="-12.7" y="-12.7" drill="0.8" shape="square"/>
<pad name="SD2" x="-12.7" y="-15.24" drill="0.8" shape="square"/>
<pad name="SD3" x="-12.7" y="-17.78" drill="0.8" shape="square"/>
<pad name="CMD" x="-12.7" y="-20.32" drill="0.8" shape="square"/>
<pad name="+5V" x="-12.7" y="-22.86" drill="0.8" shape="square"/>
<pad name="GND" x="12.7" y="22.86" drill="0.8" shape="square"/>
<pad name="IO23" x="12.7" y="20.32" drill="0.8" shape="square"/>
<pad name="IO22" x="12.7" y="17.78" drill="0.8" shape="square"/>
<pad name="TXD0" x="12.7" y="15.24" drill="0.8" shape="square"/>
<pad name="RXD" x="12.7" y="12.7" drill="0.8" shape="square"/>
<pad name="GND_1" x="12.7" y="7.62" drill="0.8" shape="square"/>
<pad name="IO21" x="12.7" y="10.16" drill="0.8" shape="square"/>
<pad name="IO19" x="12.7" y="5.08" drill="0.8" shape="square"/>
<pad name="IO18" x="12.7" y="2.54" drill="0.8" shape="square"/>
<pad name="IO16" x="12.7" y="-5.08" drill="0.8" shape="square"/>
<pad name="IO17" x="12.7" y="-2.54" drill="0.8" shape="square"/>
<pad name="IO4" x="12.7" y="-7.62" drill="0.8" shape="square"/>
<pad name="IO0" x="12.7" y="-10.16" drill="0.8" shape="square"/>
<pad name="IO2" x="12.7" y="-12.7" drill="0.8" shape="square"/>
<pad name="SD1" x="12.7" y="-17.78" drill="0.8" shape="square"/>
<pad name="IO15" x="12.7" y="-15.24" drill="0.8" shape="square"/>
<pad name="SD0" x="12.7" y="-20.32" drill="0.8" shape="square"/>
<pad name="CLK" x="12.7" y="-22.86" drill="0.8" shape="square"/>
<wire x1="-15.24" y1="25.4" x2="-7.62" y2="25.4" width="0.127" layer="21"/>
<wire x1="-7.62" y1="25.4" x2="7.62" y2="25.4" width="0.127" layer="21"/>
<wire x1="7.62" y1="25.4" x2="15.24" y2="25.4" width="0.127" layer="21"/>
<wire x1="15.24" y1="25.4" x2="15.24" y2="-25.4" width="0.127" layer="21"/>
<wire x1="15.24" y1="-25.4" x2="2.54" y2="-25.4" width="0.127" layer="21"/>
<wire x1="2.54" y1="-25.4" x2="-2.54" y2="-25.4" width="0.127" layer="21"/>
<wire x1="-2.54" y1="-25.4" x2="-15.24" y2="-25.4" width="0.127" layer="21"/>
<wire x1="-15.24" y1="-25.4" x2="-15.24" y2="25.4" width="0.127" layer="21"/>
<wire x1="-7.62" y1="30.48" x2="-7.62" y2="25.4" width="0.127" layer="21"/>
<wire x1="-7.62" y1="30.48" x2="7.62" y2="30.48" width="0.127" layer="21"/>
<wire x1="7.62" y1="25.4" x2="7.62" y2="30.48" width="0.127" layer="21"/>
<wire x1="-2.54" y1="-25.4" x2="-2.54" y2="-22.86" width="0.127" layer="21"/>
<wire x1="-2.54" y1="-22.86" x2="2.54" y2="-22.86" width="0.127" layer="21"/>
<wire x1="2.54" y1="-22.86" x2="2.54" y2="-25.4" width="0.127" layer="21"/>
<text x="-3.81" y="3.81" size="1.9304" layer="21">ESP32</text>
<text x="-11.43" y="22.86" size="0.8128" layer="21">3V3</text>
<text x="-11.43" y="20.32" size="0.8128" layer="21">EN</text>
<text x="-11.43" y="17.78" size="0.8128" layer="21">SVP</text>
<text x="-11.43" y="15.24" size="0.8128" layer="21">SVN</text>
<text x="-11.43" y="12.7" size="0.8128" layer="21">IO34</text>
<text x="-11.43" y="10.16" size="0.8128" layer="21">IO35</text>
<text x="-11.43" y="7.62" size="0.8128" layer="21">IO32</text>
<text x="-11.43" y="5.08" size="0.8128" layer="21">IO33</text>
<text x="-11.43" y="2.54" size="0.8128" layer="21">IO25</text>
<text x="-11.43" y="0" size="0.8128" layer="21">IO26</text>
<text x="-11.43" y="-2.54" size="0.8128" layer="21">IO27</text>
<text x="-11.43" y="-5.08" size="0.8128" layer="21">IO14</text>
<text x="-11.43" y="-7.62" size="0.8128" layer="21">IO12</text>
<text x="-11.43" y="-10.16" size="0.8128" layer="21">GND</text>
<text x="-11.43" y="-12.7" size="0.8128" layer="21">IO13</text>
<text x="-11.43" y="-15.24" size="0.8128" layer="21">SD2</text>
<text x="-11.43" y="-17.78" size="0.8128" layer="21">SD3</text>
<text x="-11.43" y="-20.32" size="0.8128" layer="21">CMD</text>
<text x="-11.43" y="-22.86" size="0.8128" layer="21">+5V</text>
<text x="8.89" y="22.86" size="0.8128" layer="21">GND</text>
<text x="8.89" y="20.32" size="0.8128" layer="21">IO23</text>
<text x="8.89" y="17.78" size="0.8128" layer="21">IO22</text>
<text x="8.89" y="15.24" size="0.8128" layer="21">TXD0</text>
<text x="8.89" y="12.7" size="0.8128" layer="21">RXD0</text>
<text x="8.89" y="10.16" size="0.8128" layer="21">IO21</text>
<text x="8.89" y="7.62" size="0.8128" layer="21">GND</text>
<text x="8.89" y="5.08" size="0.8128" layer="21">IO19</text>
<text x="8.89" y="2.54" size="0.8128" layer="21">IO18</text>
<text x="8.89" y="0" size="0.8128" layer="21">IO5</text>
<text x="8.89" y="-2.54" size="0.8128" layer="21">IO17</text>
<text x="8.89" y="-5.08" size="0.8128" layer="21">IO16</text>
<text x="8.89" y="-7.62" size="0.8128" layer="21">IO4</text>
<text x="8.89" y="-10.16" size="0.8128" layer="21">IO0</text>
<text x="8.89" y="-12.7" size="0.8128" layer="21">IO2</text>
<text x="8.89" y="-15.24" size="0.8128" layer="21">IO15</text>
<text x="8.89" y="-17.78" size="0.8128" layer="21">SD1</text>
<text x="8.89" y="-20.32" size="0.8128" layer="21">SD0</text>
<text x="8.89" y="-22.86" size="0.8128" layer="21">CLK</text>
<text x="-3.81" y="-5.08" size="1.27" layer="21">&gt;NAME</text>
</package>
<package name="R">
<pad name="P$1" x="-6.35" y="0" drill="0.8" shape="square"/>
<pad name="P$2" x="6.35" y="0" drill="0.8" shape="square"/>
<wire x1="-3.81" y1="1.27" x2="-3.81" y2="0" width="0.127" layer="21"/>
<wire x1="-3.81" y1="0" x2="-3.81" y2="-1.27" width="0.127" layer="21"/>
<wire x1="-3.81" y1="-1.27" x2="3.81" y2="-1.27" width="0.127" layer="21"/>
<wire x1="3.81" y1="1.27" x2="-3.81" y2="1.27" width="0.127" layer="21"/>
<wire x1="-6.35" y1="0" x2="-3.81" y2="0" width="0.127" layer="21"/>
<wire x1="3.81" y1="1.27" x2="3.81" y2="0" width="0.127" layer="21"/>
<wire x1="3.81" y1="-1.27" x2="3.81" y2="0" width="0.127" layer="21"/>
<wire x1="3.81" y1="0" x2="6.35" y2="0" width="0.127" layer="21"/>
</package>
<package name="TRANSISTOR">
<pad name="B" x="1.27" y="1.27" drill="0.8" shape="square"/>
<pad name="E" x="1.27" y="-1.27" drill="0.8" shape="square"/>
<pad name="C" x="1.27" y="3.81" drill="0.8" shape="square"/>
<wire x1="3.81" y1="-1.27" x2="3.81" y2="3.81" width="0.127" layer="21" curve="-270"/>
<wire x1="3.81" y1="3.81" x2="3.81" y2="-1.27" width="0.127" layer="21"/>
<text x="-0.635" y="3.175" size="0.8128" layer="21">C</text>
<text x="-0.635" y="0.9525" size="0.8128" layer="21">B</text>
<text x="-0.635" y="-1.27" size="0.8128" layer="21">E</text>
</package>
<package name="SWITCH">
<pad name="P$1" x="-1.27" y="0" drill="0.6" shape="square"/>
<pad name="P$2" x="1.27" y="0" drill="0.6" shape="square"/>
<wire x1="-3.81" y1="2.54" x2="-3.81" y2="-2.54" width="0.127" layer="21"/>
<wire x1="-3.81" y1="-2.54" x2="3.81" y2="-2.54" width="0.127" layer="21"/>
<wire x1="3.81" y1="-2.54" x2="3.81" y2="2.54" width="0.127" layer="21"/>
<wire x1="3.81" y1="2.54" x2="-3.81" y2="2.54" width="0.127" layer="21"/>
</package>
<package name="TOUCH_SENSOR">
<pad name="P$1" x="0" y="0" drill="1" shape="square"/>
<circle x="0" y="0" radius="1.27" width="0.127" layer="21"/>
</package>
<package name="RGBLED">
<pad name="VIN_R" x="0" y="0" drill="0.8" shape="square"/>
<pad name="VIN_G" x="0" y="2.54" drill="0.8" shape="square"/>
<pad name="GND" x="0" y="-2.54" drill="0.8" shape="square"/>
<pad name="VIN_B" x="0" y="5.08" drill="0.8" shape="square"/>
<wire x1="-1.27" y1="7.62" x2="-1.27" y2="-5.08" width="0.127" layer="21"/>
<text x="1.27" y="-2.54" size="0.4064" layer="21">GND</text>
<text x="1.27" y="0" size="0.4064" layer="21">VIN_R</text>
<text x="1.27" y="2.54" size="0.4064" layer="21">VIN_G</text>
<text x="1.27" y="5.08" size="0.4064" layer="21">VIN_B</text>
<text x="6.35" y="1.27" size="0.8128" layer="21">RGB LED</text>
<wire x1="-1.27" y1="7.62" x2="16.51" y2="7.62" width="0.127" layer="21"/>
<wire x1="-1.27" y1="-5.08" x2="16.51" y2="-5.08" width="0.127" layer="21"/>
<wire x1="16.51" y1="7.62" x2="16.51" y2="-5.08" width="0.127" layer="21"/>
</package>
<package name="C">
<pad name="PIN_PLUS" x="-2.54" y="0" drill="0.8" shape="square"/>
<pad name="PIN_GND" x="2.54" y="0" drill="0.8" shape="square"/>
<circle x="0" y="0" radius="5.08" width="0.127" layer="21"/>
<wire x1="-3.175" y1="-1.905" x2="-1.905" y2="-1.905" width="0.127" layer="21"/>
<wire x1="-2.54" y1="-1.27" x2="-2.54" y2="-2.54" width="0.127" layer="21"/>
<wire x1="1.905" y1="-1.905" x2="3.175" y2="-1.905" width="0.127" layer="21"/>
</package>
<package name="DIODE_BRIDGE">
<pad name="GND" x="-3.81" y="2.54" drill="0.6" shape="square"/>
<pad name="AC1" x="-3.81" y="-2.54" drill="0.6" shape="square"/>
<pad name="AC2" x="3.81" y="-2.54" drill="0.6" shape="square"/>
<pad name="VCC" x="3.81" y="2.54" drill="0.6" shape="square"/>
<wire x1="-6.35" y1="5.08" x2="-6.35" y2="-5.08" width="0.127" layer="21"/>
<wire x1="-6.35" y1="-5.08" x2="6.35" y2="-5.08" width="0.127" layer="21"/>
<wire x1="6.35" y1="-5.08" x2="6.35" y2="5.08" width="0.127" layer="21"/>
<wire x1="-6.35" y1="5.08" x2="6.35" y2="5.08" width="0.127" layer="21"/>
<text x="-2.54" y="-2.54" size="1.27" layer="21">~</text>
<text x="1.27" y="-2.54" size="1.27" layer="21">~</text>
<text x="-2.54" y="1.27" size="1.27" layer="21">-</text>
<text x="1.27" y="1.27" size="1.27" layer="21">+</text>
</package>
<package name="VOLTAGE_REGULATOR">
<pad name="IN" x="-2.54" y="0" drill="0.6" shape="square"/>
<pad name="GND" x="0" y="0" drill="0.6" shape="square"/>
<pad name="OUT" x="2.54" y="0" drill="0.6" shape="square"/>
<wire x1="-5.08" y1="2.54" x2="-5.08" y2="-2.54" width="0.127" layer="21"/>
<wire x1="-5.08" y1="-2.54" x2="5.08" y2="-2.54" width="0.127" layer="21"/>
<wire x1="5.08" y1="-2.54" x2="5.08" y2="2.54" width="0.127" layer="21"/>
<wire x1="5.08" y1="2.54" x2="-5.08" y2="2.54" width="0.127" layer="21"/>
<text x="-3.81" y="1.27" size="0.6096" layer="21">in</text>
<text x="-1.27" y="1.27" size="0.6096" layer="21">gnd</text>
<text x="2.54" y="1.27" size="0.6096" layer="21">out</text>
</package>
<package name="BME280">
<pad name="GND" x="-5.08" y="1.27" drill="0.8" shape="square"/>
<pad name="SCL" x="-5.08" y="-1.27" drill="0.8" shape="square"/>
<pad name="VCC" x="-5.08" y="3.81" drill="0.8" shape="square"/>
<pad name="SDA" x="-5.08" y="-3.81" drill="0.8" shape="square"/>
<wire x1="-6.35" y1="5.08" x2="-6.35" y2="-10.16" width="0.127" layer="21"/>
<text x="-3.81" y="3.81" size="0.8128" layer="21">VCC</text>
<text x="-3.81" y="1.27" size="0.8128" layer="21">GND</text>
<text x="-3.81" y="-1.27" size="0.8128" layer="21">SCL</text>
<text x="-3.81" y="-3.81" size="0.8128" layer="21">SDA</text>
<wire x1="-6.35" y1="5.08" x2="2.54" y2="5.08" width="0.127" layer="21"/>
<wire x1="2.54" y1="5.08" x2="2.54" y2="-10.16" width="0.127" layer="21"/>
<wire x1="2.54" y1="-10.16" x2="-6.35" y2="-10.16" width="0.127" layer="21"/>
<text x="-5.08" y="-7.62" size="1.27" layer="21">BME280</text>
</package>
<package name="GY-SGP30">
<pad name="VIN" x="0" y="3.81" drill="0.8" shape="square"/>
<pad name="GND" x="0" y="1.27" drill="0.8" shape="square"/>
<pad name="SCL" x="0" y="-1.27" drill="0.8" shape="square"/>
<pad name="SDA" x="0" y="-3.81" drill="0.8" shape="square"/>
<wire x1="-1.27" y1="5.08" x2="-1.27" y2="-5.08" width="0.127" layer="21"/>
<wire x1="-1.27" y1="-5.08" x2="7.62" y2="-5.08" width="0.127" layer="21"/>
<text x="1.27" y="3.81" size="0.6096" layer="21">VIN</text>
<text x="1.27" y="1.27" size="0.6096" layer="21">GND</text>
<text x="1.27" y="-1.27" size="0.6096" layer="21">SCL</text>
<text x="1.27" y="-3.81" size="0.6096" layer="21">SDA</text>
<wire x1="7.62" y1="5.08" x2="-1.27" y2="5.08" width="0.127" layer="21"/>
<wire x1="7.62" y1="5.08" x2="7.62" y2="-5.08" width="0.127" layer="21"/>
<text x="5.08" y="-2.54" size="0.8128" layer="21" rot="R90">GY-SGP30</text>
</package>
<package name="MSGEQ7">
<pad name="GND" x="-3.81" y="1.27" drill="0.8" shape="square"/>
<pad name="OUT" x="-3.81" y="-1.27" drill="0.8" shape="square"/>
<pad name="VCC" x="-3.81" y="3.81" drill="0.8" shape="square"/>
<pad name="STROBE" x="-3.81" y="-3.81" drill="0.8" shape="square"/>
<pad name="IN" x="3.81" y="-3.81" drill="0.8" shape="square"/>
<pad name="IGND" x="3.81" y="-1.27" drill="0.8" shape="square"/>
<pad name="RESET" x="3.81" y="1.27" drill="0.8" shape="square"/>
<pad name="CKIN" x="3.81" y="3.81" drill="0.8" shape="square"/>
<wire x1="-6.35" y1="6.35" x2="-6.35" y2="-6.35" width="0.127" layer="21"/>
<wire x1="-6.35" y1="-6.35" x2="6.35" y2="-6.35" width="0.127" layer="21"/>
<wire x1="6.35" y1="-6.35" x2="6.35" y2="6.35" width="0.127" layer="21"/>
<wire x1="6.35" y1="6.35" x2="0.635" y2="6.35" width="0.127" layer="21"/>
<wire x1="0.635" y1="6.35" x2="-0.635" y2="6.35" width="0.127" layer="21"/>
<wire x1="-0.635" y1="6.35" x2="-6.35" y2="6.35" width="0.127" layer="21"/>
<wire x1="-0.635" y1="6.35" x2="-0.635" y2="4.445" width="0.127" layer="21"/>
<wire x1="-0.635" y1="4.445" x2="0.635" y2="4.445" width="0.127" layer="21"/>
<wire x1="0.635" y1="4.445" x2="0.635" y2="6.35" width="0.127" layer="21"/>
<text x="-2.54" y="3.175" size="0.6096" layer="21">VCC</text>
<text x="-2.54" y="0.635" size="0.6096" layer="21">GND</text>
<text x="-2.54" y="-1.905" size="0.6096" layer="21">OUT</text>
<text x="-2.54" y="-4.445" size="0.6096" layer="21">STROBE</text>
<text x="0.635" y="3.175" size="0.6096" layer="21">CKIN</text>
<text x="0" y="0.635" size="0.6096" layer="21">RESET</text>
<text x="0.635" y="-1.905" size="0.6096" layer="21">IGND</text>
<text x="1.905" y="-4.445" size="0.6096" layer="21">IN</text>
</package>
<package name="C-1">
<pad name="P$1" x="-1.27" y="0" drill="0.6" shape="square"/>
<pad name="P$2" x="1.27" y="0" drill="0.6" shape="square"/>
<circle x="0" y="0" radius="2.54" width="0.127" layer="21"/>
</package>
<package name="MICROPHONE">
<pad name="P$1" x="-1.27" y="0" drill="0.6" shape="square"/>
<pad name="P$2" x="1.27" y="0" drill="0.6" shape="square"/>
<wire x1="-3.81" y1="2.54" x2="-3.81" y2="-2.54" width="0.127" layer="21"/>
<wire x1="-3.81" y1="-2.54" x2="3.81" y2="-2.54" width="0.127" layer="21"/>
<wire x1="3.81" y1="-2.54" x2="3.81" y2="2.54" width="0.127" layer="21"/>
<wire x1="3.81" y1="2.54" x2="-3.81" y2="2.54" width="0.127" layer="21"/>
</package>
<package name="X">
<pad name="P$1" x="3.81" y="0" drill="0.6" shape="square"/>
<pad name="P$2" x="-3.81" y="0" drill="0.6" shape="square"/>
<wire x1="-5.08" y1="1.27" x2="-5.08" y2="-1.27" width="0.127" layer="21"/>
<wire x1="-5.08" y1="-1.27" x2="5.08" y2="-1.27" width="0.127" layer="21"/>
<wire x1="5.08" y1="-1.27" x2="5.08" y2="1.27" width="0.127" layer="21"/>
<wire x1="5.08" y1="1.27" x2="-5.08" y2="1.27" width="0.127" layer="21"/>
</package>
<package name="L-2">
<pad name="L1-1" x="-5.08" y="5.08" drill="0.6" shape="square"/>
<pad name="NC" x="0" y="5.08" drill="0.6" shape="square"/>
<pad name="L1-2" x="5.08" y="5.08" drill="0.6" shape="square"/>
<pad name="L2-2" x="5.08" y="-5.08" drill="0.6" shape="square"/>
<pad name="L2-1" x="-5.08" y="-5.08" drill="0.6" shape="square"/>
<wire x1="-7.62" y1="7.62" x2="-7.62" y2="-7.62" width="0.127" layer="21"/>
<wire x1="-7.62" y1="-7.62" x2="7.62" y2="-7.62" width="0.127" layer="21"/>
<wire x1="7.62" y1="-7.62" x2="7.62" y2="7.62" width="0.127" layer="21"/>
<wire x1="7.62" y1="7.62" x2="-7.62" y2="7.62" width="0.127" layer="21"/>
<wire x1="5.08" y1="3.81" x2="2.54" y2="3.81" width="0.127" layer="21" curve="-180"/>
<wire x1="2.54" y1="3.81" x2="0" y2="3.81" width="0.127" layer="21" curve="-180"/>
<wire x1="0" y1="3.81" x2="-2.54" y2="3.81" width="0.127" layer="21" curve="-180"/>
<wire x1="-2.54" y1="3.81" x2="-5.08" y2="3.81" width="0.127" layer="21" curve="-180"/>
<wire x1="-5.08" y1="-3.81" x2="-2.54" y2="-3.81" width="0.127" layer="21" curve="-180"/>
<wire x1="-2.54" y1="-3.81" x2="0" y2="-3.81" width="0.127" layer="21" curve="-180"/>
<wire x1="0" y1="-3.81" x2="2.54" y2="-3.81" width="0.127" layer="21" curve="-180"/>
<wire x1="2.54" y1="-3.81" x2="5.08" y2="-3.81" width="0.127" layer="21" curve="-180"/>
</package>
<package name="433MHZ_TRANSMITTER">
<pad name="VCC" x="-2.54" y="0" drill="0.6" shape="square"/>
<pad name="DATA" x="0" y="0" drill="0.6" shape="square"/>
<pad name="GND" x="2.54" y="0" drill="0.6" shape="square"/>
<wire x1="7.62" y1="2.54" x2="7.62" y2="-2.54" width="0.127" layer="21"/>
<wire x1="7.62" y1="-2.54" x2="-7.62" y2="-2.54" width="0.127" layer="21"/>
<wire x1="-7.62" y1="-2.54" x2="-7.62" y2="2.54" width="0.127" layer="21"/>
<wire x1="-7.62" y1="2.54" x2="7.62" y2="2.54" width="0.127" layer="21"/>
<text x="-3.81" y="1.27" size="0.6096" layer="21">VCC</text>
<text x="-1.27" y="1.27" size="0.6096" layer="21">DATA</text>
<text x="1.27" y="1.27" size="0.6096" layer="21">GND</text>
</package>
<package name="L-3">
<pad name="L1-1" x="-5.08" y="5.08" drill="0.6" shape="square"/>
<pad name="L1-2" x="0" y="5.08" drill="0.6" shape="square"/>
<pad name="L1-3" x="5.08" y="5.08" drill="0.6" shape="square"/>
<pad name="L2-2" x="5.08" y="-5.08" drill="0.6" shape="square"/>
<pad name="L2-1" x="-5.08" y="-5.08" drill="0.6" shape="square"/>
<wire x1="-7.62" y1="7.62" x2="-7.62" y2="-7.62" width="0.127" layer="21"/>
<wire x1="-7.62" y1="-7.62" x2="7.62" y2="-7.62" width="0.127" layer="21"/>
<wire x1="7.62" y1="-7.62" x2="7.62" y2="7.62" width="0.127" layer="21"/>
<wire x1="7.62" y1="7.62" x2="-7.62" y2="7.62" width="0.127" layer="21"/>
<wire x1="5.08" y1="3.81" x2="2.54" y2="3.81" width="0.127" layer="21" curve="-180"/>
<wire x1="2.54" y1="3.81" x2="0" y2="3.81" width="0.127" layer="21" curve="-180"/>
<wire x1="0" y1="3.81" x2="-2.54" y2="3.81" width="0.127" layer="21" curve="-180"/>
<wire x1="-2.54" y1="3.81" x2="-5.08" y2="3.81" width="0.127" layer="21" curve="-180"/>
<wire x1="-5.08" y1="-3.81" x2="-2.54" y2="-3.81" width="0.127" layer="21" curve="-180"/>
<wire x1="-2.54" y1="-3.81" x2="0" y2="-3.81" width="0.127" layer="21" curve="-180"/>
<wire x1="0" y1="-3.81" x2="2.54" y2="-3.81" width="0.127" layer="21" curve="-180"/>
<wire x1="2.54" y1="-3.81" x2="5.08" y2="-3.81" width="0.127" layer="21" curve="-180"/>
</package>
<package name="MOSFET_N">
<pad name="S" x="2.54" y="0" drill="0.6" shape="square"/>
<pad name="D" x="0" y="0" drill="0.6" shape="square"/>
<pad name="G" x="-2.54" y="0" drill="0.6" shape="square"/>
<text x="-3.81" y="-0.635" size="0.6096" layer="21">G</text>
<text x="-1.27" y="-0.635" size="0.6096" layer="21">D</text>
<text x="1.27" y="-0.635" size="0.6096" layer="21">S</text>
<wire x1="-5.08" y1="2.54" x2="-5.08" y2="1.27" width="0.127" layer="21"/>
<wire x1="-5.08" y1="1.27" x2="-5.08" y2="-1.27" width="0.127" layer="21"/>
<wire x1="-5.08" y1="-1.27" x2="5.08" y2="-1.27" width="0.127" layer="21"/>
<wire x1="5.08" y1="-1.27" x2="5.08" y2="1.27" width="0.127" layer="21"/>
<wire x1="5.08" y1="1.27" x2="5.08" y2="2.54" width="0.127" layer="21"/>
<wire x1="5.08" y1="2.54" x2="1.27" y2="2.54" width="0.127" layer="21"/>
<wire x1="1.27" y1="2.54" x2="-1.27" y2="2.54" width="0.127" layer="21"/>
<wire x1="-1.27" y1="2.54" x2="-5.08" y2="2.54" width="0.127" layer="21"/>
<wire x1="-5.08" y1="1.27" x2="-1.27" y2="1.27" width="0.127" layer="21"/>
<wire x1="-1.27" y1="1.27" x2="1.27" y2="1.27" width="0.127" layer="21"/>
<wire x1="1.27" y1="1.27" x2="5.08" y2="1.27" width="0.127" layer="21"/>
<wire x1="-1.27" y1="2.54" x2="-1.27" y2="1.27" width="0.127" layer="21"/>
<wire x1="1.27" y1="2.54" x2="1.27" y2="1.27" width="0.127" layer="21"/>
</package>
<package name="SERVO">
<pad name="VCC" x="0" y="0" drill="1.1" shape="square"/>
<pad name="PULSE" x="0" y="2.54" drill="1.1" shape="square"/>
<pad name="GND" x="0" y="-2.54" drill="1.1" shape="square"/>
<wire x1="-2.54" y1="5.08" x2="-2.54" y2="-5.08" width="0.127" layer="21"/>
<wire x1="-2.54" y1="-5.08" x2="2.54" y2="-5.08" width="0.127" layer="21"/>
<wire x1="2.54" y1="-5.08" x2="2.54" y2="5.08" width="0.127" layer="21"/>
<wire x1="2.54" y1="5.08" x2="-2.54" y2="5.08" width="0.127" layer="21"/>
<text x="-0.635" y="3.4925" size="0.6096" layer="21">PULSE</text>
<text x="-0.635" y="0.9525" size="0.6096" layer="21">VCC</text>
<text x="-0.635" y="-1.5875" size="0.6096" layer="21">GND</text>
</package>
<package name="CD4047">
<pad name="Q__" x="3.81" y="0" drill="0.8" shape="square"/>
<pad name="ASTABLE__" x="-3.81" y="0" drill="0.8" shape="square"/>
<pad name="RC" x="-3.81" y="2.54" drill="0.8" shape="square"/>
<pad name="R" x="-3.81" y="5.08" drill="0.8" shape="square"/>
<pad name="ASTABLE" x="-3.81" y="-2.54" drill="0.8" shape="square"/>
<pad name="-TRIGGER" x="-3.81" y="-5.08" drill="0.8" shape="square"/>
<pad name="GND" x="-3.81" y="-7.62" drill="0.8" shape="square"/>
<pad name="C" x="-3.81" y="7.62" drill="0.8" shape="square"/>
<pad name="VCC" x="3.81" y="7.62" drill="0.8" shape="square"/>
<pad name="OSCOUT" x="3.81" y="5.08" drill="0.8" shape="square"/>
<pad name="RETRIGGER" x="3.81" y="2.54" drill="0.8" shape="square"/>
<pad name="Q" x="3.81" y="-2.54" drill="0.8" shape="square"/>
<pad name="EXT..RESET" x="3.81" y="-5.08" drill="0.8" shape="square"/>
<pad name="+TRIGGER" x="3.81" y="-7.62" drill="0.8" shape="square"/>
<wire x1="-5.08" y1="8.89" x2="-5.08" y2="-8.89" width="0.127" layer="21"/>
<wire x1="-5.08" y1="-8.89" x2="5.08" y2="-8.89" width="0.127" layer="21"/>
<wire x1="5.08" y1="-8.89" x2="5.08" y2="8.89" width="0.127" layer="21"/>
<wire x1="5.08" y1="8.89" x2="1.27" y2="8.89" width="0.127" layer="21"/>
<wire x1="1.27" y1="8.89" x2="-1.27" y2="8.89" width="0.127" layer="21"/>
<wire x1="-1.27" y1="8.89" x2="-5.08" y2="8.89" width="0.127" layer="21"/>
<wire x1="-1.27" y1="8.89" x2="-1.27" y2="7.62" width="0.127" layer="21"/>
<wire x1="-1.27" y1="7.62" x2="1.27" y2="7.62" width="0.127" layer="21"/>
<wire x1="1.27" y1="7.62" x2="1.27" y2="8.89" width="0.127" layer="21"/>
</package>
<package name="RD">
<pad name="P1" x="-2.54" y="0" drill="0.6" shape="square"/>
<pad name="P2" x="0" y="0" drill="0.6" shape="square"/>
<pad name="P3" x="2.54" y="0" drill="0.6" shape="square"/>
<wire x1="-3.81" y1="1.27" x2="-3.81" y2="-1.27" width="0.127" layer="21"/>
<wire x1="-3.81" y1="-1.27" x2="3.81" y2="-1.27" width="0.127" layer="21"/>
<wire x1="3.81" y1="-1.27" x2="3.81" y2="1.27" width="0.127" layer="21"/>
<wire x1="3.81" y1="1.27" x2="-3.81" y2="1.27" width="0.127" layer="21"/>
</package>
<package name="HALL_SENSOR">
<pad name="VCC" x="0" y="2.54" drill="0.6" shape="square"/>
<pad name="GND" x="0" y="0" drill="0.6" shape="square"/>
<pad name="OUT" x="0" y="-2.54" drill="0.6" shape="square"/>
<wire x1="0" y1="3.81" x2="-1.27" y2="2.54" width="0.127" layer="21"/>
<wire x1="-1.27" y1="2.54" x2="-1.27" y2="-2.54" width="0.127" layer="21"/>
<wire x1="-1.27" y1="-2.54" x2="0" y2="-3.81" width="0.127" layer="21"/>
<wire x1="1.27" y1="-3.81" x2="0" y2="-3.81" width="0.127" layer="21"/>
<wire x1="1.27" y1="-3.81" x2="1.27" y2="3.81" width="0.127" layer="21"/>
<wire x1="1.27" y1="3.81" x2="0" y2="3.81" width="0.127" layer="21"/>
<text x="-0.635" y="1.5875" size="0.3048" layer="21">VCC</text>
<text x="-0.635" y="-0.9525" size="0.3048" layer="21">GND</text>
<text x="-0.635" y="-1.905" size="0.3048" layer="21">OUT</text>
</package>
</packages>
<symbols>
<symbol name="ACDC">
<pin name="220V_L" x="-25.4" y="5.08" length="middle" direction="pwr"/>
<pin name="220V_N" x="-25.4" y="-5.08" length="middle" direction="pwr"/>
<pin name="OUT_GND" x="25.4" y="5.08" length="middle" direction="sup" rot="R180"/>
<pin name="OUT_5V" x="25.4" y="-5.08" length="middle" direction="pwr" rot="R180"/>
<wire x1="-20.32" y1="7.62" x2="-20.32" y2="-7.62" width="0.254" layer="94"/>
<wire x1="-20.32" y1="-7.62" x2="20.32" y2="-7.62" width="0.254" layer="94"/>
<wire x1="20.32" y1="-7.62" x2="20.32" y2="7.62" width="0.254" layer="94"/>
<wire x1="20.32" y1="7.62" x2="-20.32" y2="7.62" width="0.254" layer="94"/>
<text x="-5.08" y="2.54" size="1.778" layer="94">&gt;NAME</text>
</symbol>
<symbol name="ESP32">
<pin name="IO26" x="-20.32" y="0" length="middle"/>
<pin name="IO27" x="-20.32" y="-2.54" length="middle"/>
<pin name="IO25" x="-20.32" y="2.54" length="middle"/>
<pin name="IO14" x="-20.32" y="-5.08" length="middle"/>
<pin name="IO33" x="-20.32" y="5.08" length="middle"/>
<pin name="IO12" x="-20.32" y="-7.62" length="middle"/>
<pin name="IO32" x="-20.32" y="7.62" length="middle"/>
<pin name="GND_2" x="-20.32" y="-10.16" length="middle"/>
<pin name="IO35" x="-20.32" y="10.16" length="middle"/>
<pin name="IO13" x="-20.32" y="-12.7" length="middle"/>
<pin name="IO34" x="-20.32" y="12.7" length="middle"/>
<pin name="SD2" x="-20.32" y="-15.24" length="middle"/>
<pin name="SVN" x="-20.32" y="15.24" length="middle"/>
<pin name="SD3" x="-20.32" y="-17.78" length="middle"/>
<pin name="SVP" x="-20.32" y="17.78" length="middle"/>
<pin name="CMD" x="-20.32" y="-20.32" length="middle"/>
<pin name="EN" x="-20.32" y="20.32" length="middle"/>
<pin name="5V" x="-20.32" y="-22.86" length="middle" direction="sup"/>
<pin name="3V3" x="-20.32" y="22.86" length="middle" direction="pwr"/>
<pin name="IO23" x="20.32" y="17.78" length="middle" rot="R180"/>
<pin name="IO22" x="20.32" y="20.32" length="middle" rot="R180"/>
<pin name="TXD0" x="20.32" y="15.24" length="middle" rot="R180"/>
<pin name="GND" x="20.32" y="22.86" length="middle" direction="sup" rot="R180"/>
<pin name="RXD0" x="20.32" y="12.7" length="middle" rot="R180"/>
<pin name="IO21" x="20.32" y="10.16" length="middle" rot="R180"/>
<pin name="GND_1" x="20.32" y="7.62" length="middle" rot="R180"/>
<pin name="IO19" x="20.32" y="5.08" length="middle" rot="R180"/>
<pin name="IO18" x="20.32" y="2.54" length="middle" rot="R180"/>
<pin name="IO5" x="20.32" y="0" length="middle" rot="R180"/>
<pin name="IO17" x="20.32" y="-2.54" length="middle" rot="R180"/>
<pin name="IO16" x="20.32" y="-5.08" length="middle" rot="R180"/>
<pin name="CLK" x="20.32" y="-22.86" length="middle" rot="R180"/>
<pin name="SD0" x="20.32" y="-20.32" length="middle" rot="R180"/>
<pin name="SD1" x="20.32" y="-17.78" length="middle" rot="R180"/>
<pin name="IO15" x="20.32" y="-15.24" length="middle" rot="R180"/>
<pin name="IO2" x="20.32" y="-12.7" length="middle" rot="R180"/>
<pin name="IO0" x="20.32" y="-10.16" length="middle" rot="R180"/>
<pin name="IO4" x="20.32" y="-7.62" length="middle" rot="R180"/>
<wire x1="-15.24" y1="25.4" x2="-15.24" y2="-25.4" width="0.254" layer="94"/>
<wire x1="-15.24" y1="-25.4" x2="-2.54" y2="-25.4" width="0.254" layer="94"/>
<wire x1="-2.54" y1="-25.4" x2="2.54" y2="-25.4" width="0.254" layer="94"/>
<wire x1="2.54" y1="-25.4" x2="15.24" y2="-25.4" width="0.254" layer="94"/>
<wire x1="15.24" y1="-25.4" x2="15.24" y2="25.4" width="0.254" layer="94"/>
<wire x1="15.24" y1="25.4" x2="10.16" y2="25.4" width="0.254" layer="94"/>
<text x="-5.08" y="27.94" size="1.778" layer="94">&gt;NAME</text>
<text x="-5.08" y="-27.94" size="1.778" layer="94">&gt;VALUE</text>
<wire x1="10.16" y1="25.4" x2="-10.16" y2="25.4" width="0.254" layer="94"/>
<wire x1="-10.16" y1="25.4" x2="-15.24" y2="25.4" width="0.254" layer="94"/>
<wire x1="-10.16" y1="25.4" x2="-10.16" y2="30.48" width="0.254" layer="94"/>
<wire x1="-10.16" y1="30.48" x2="10.16" y2="30.48" width="0.254" layer="94"/>
<wire x1="10.16" y1="30.48" x2="10.16" y2="25.4" width="0.254" layer="94"/>
<wire x1="-2.54" y1="-25.4" x2="-2.54" y2="-22.86" width="0.254" layer="94"/>
<wire x1="-2.54" y1="-22.86" x2="2.54" y2="-22.86" width="0.254" layer="94"/>
<wire x1="2.54" y1="-22.86" x2="2.54" y2="-25.4" width="0.254" layer="94"/>
</symbol>
<symbol name="R">
<pin name="P$1" x="-7.62" y="0" visible="off" length="middle"/>
<pin name="P$2" x="8.89" y="0" visible="off" length="middle" rot="R180"/>
<text x="-6.35" y="2.54" size="1.778" layer="94">&gt;NAME</text>
<text x="-6.35" y="-3.81" size="1.778" layer="94">&gt;VALUE</text>
<wire x1="-2.54" y1="1.27" x2="-2.54" y2="-1.27" width="0.254" layer="94"/>
<wire x1="-2.54" y1="-1.27" x2="3.81" y2="-1.27" width="0.254" layer="94"/>
<wire x1="3.81" y1="-1.27" x2="3.81" y2="1.27" width="0.254" layer="94"/>
<wire x1="3.81" y1="1.27" x2="-2.54" y2="1.27" width="0.254" layer="94"/>
</symbol>
<symbol name="TRANSISTOR_NPN">
<pin name="B" x="-7.62" y="0" visible="off" length="middle"/>
<pin name="C" x="0" y="7.62" visible="off" length="middle" rot="R270"/>
<pin name="E" x="0" y="-7.62" visible="off" length="middle" rot="R90"/>
<circle x="0" y="0" radius="3.81" width="0.254" layer="94"/>
<wire x1="-2.54" y1="2.54" x2="-2.54" y2="0" width="0.254" layer="94"/>
<wire x1="-2.54" y1="0" x2="-2.54" y2="-2.54" width="0.254" layer="94"/>
<wire x1="0" y1="2.54" x2="-2.54" y2="0" width="0.254" layer="94"/>
<wire x1="0" y1="-2.54" x2="-2.54" y2="0" width="0.254" layer="94"/>
<polygon width="0.254" layer="94">
<vertex x="0" y="-2.54"/>
<vertex x="0" y="-1.27"/>
<vertex x="-1.27" y="-2.54"/>
</polygon>
<text x="3.81" y="1.27" size="1.778" layer="94">&gt;NAME</text>
<text x="3.81" y="-2.54" size="1.778" layer="94">&gt;VALUE</text>
</symbol>
<symbol name="SWITCH">
<pin name="P$1" x="-10.16" y="0" visible="off" length="middle"/>
<pin name="P$2" x="10.16" y="0" visible="off" length="middle" rot="R180"/>
<wire x1="-5.08" y1="0" x2="-2.54" y2="0" width="0.254" layer="94"/>
<wire x1="5.08" y1="0" x2="2.54" y2="0" width="0.254" layer="94"/>
<wire x1="-2.54" y1="0" x2="2.54" y2="2.54" width="0.254" layer="94"/>
<text x="-5.08" y="5.08" size="1.778" layer="94">&gt;NAME</text>
<text x="-5.08" y="-5.08" size="1.778" layer="94">&gt;VALUE</text>
</symbol>
<symbol name="TOUCH_SENSOR">
<pin name="P$1" x="-7.62" y="0" visible="off" length="middle"/>
<wire x1="-2.54" y1="2.54" x2="-2.54" y2="-2.54" width="0.254" layer="94"/>
<wire x1="-2.54" y1="-2.54" x2="2.54" y2="-2.54" width="0.254" layer="94"/>
<wire x1="2.54" y1="-2.54" x2="2.54" y2="2.54" width="0.254" layer="94"/>
<wire x1="2.54" y1="2.54" x2="-2.54" y2="2.54" width="0.254" layer="94"/>
<text x="-5.08" y="5.08" size="1.778" layer="94">&gt;NAME</text>
</symbol>
<symbol name="RGBLED">
<pin name="GND" x="-7.62" y="-5.08" length="middle" direction="sup"/>
<pin name="VIN_R" x="-7.62" y="-2.54" length="middle" direction="in"/>
<pin name="VIN_G" x="-7.62" y="0" length="middle" direction="in"/>
<pin name="VIN_B" x="-7.62" y="2.54" length="middle" direction="in"/>
<wire x1="-2.54" y1="-10.16" x2="-2.54" y2="7.62" width="0.254" layer="94"/>
<wire x1="-2.54" y1="7.62" x2="10.16" y2="7.62" width="0.254" layer="94"/>
<wire x1="10.16" y1="7.62" x2="10.16" y2="-10.16" width="0.254" layer="94"/>
<wire x1="10.16" y1="-10.16" x2="-2.54" y2="-10.16" width="0.254" layer="94"/>
<text x="0" y="10.16" size="1.778" layer="94">&gt;NAME</text>
</symbol>
<symbol name="C">
<pin name="PIN_PLUS" x="-7.62" y="0" visible="off" length="middle"/>
<pin name="PIN_GND" x="5.08" y="0" visible="off" length="middle" rot="R180"/>
<wire x1="0" y1="2.54" x2="0" y2="-2.54" width="1.27" layer="94"/>
<wire x1="-2.54" y1="2.54" x2="-2.54" y2="-2.54" width="1.27" layer="94"/>
<text x="-5.08" y="5.08" size="1.778" layer="94">&gt;NAME</text>
<text x="-5.08" y="-7.62" size="1.778" layer="94">&gt;VALUE</text>
<wire x1="-5.715" y1="1.27" x2="-4.445" y2="1.27" width="0.254" layer="94"/>
<wire x1="-5.08" y1="1.905" x2="-5.08" y2="0.635" width="0.254" layer="94"/>
<text x="1.905" y="1.27" size="0.6096" layer="94">GND</text>
</symbol>
<symbol name="DIODE_BRIDGE">
<pin name="AC1" x="-10.16" y="5.08" visible="off" length="middle" direction="pwr"/>
<pin name="AC2" x="-10.16" y="-5.08" visible="off" length="middle" direction="pwr"/>
<pin name="GND" x="10.16" y="-5.08" visible="off" length="middle" direction="sup" rot="R180"/>
<pin name="VCC" x="10.16" y="5.08" visible="off" length="middle" direction="sup" rot="R180"/>
<wire x1="-5.08" y1="7.62" x2="-5.08" y2="-7.62" width="0.254" layer="94"/>
<wire x1="-5.08" y1="-7.62" x2="5.08" y2="-7.62" width="0.254" layer="94"/>
<wire x1="5.08" y1="-7.62" x2="5.08" y2="7.62" width="0.254" layer="94"/>
<wire x1="-5.08" y1="7.62" x2="5.08" y2="7.62" width="0.254" layer="94"/>
<text x="-3.81" y="3.81" size="1.778" layer="94">~</text>
<text x="-3.81" y="-5.08" size="1.778" layer="94">~</text>
<text x="2.54" y="3.81" size="1.778" layer="94">+</text>
<text x="2.54" y="-5.08" size="1.778" layer="94">-</text>
<text x="-3.81" y="8.89" size="1.778" layer="94">&gt;NAME</text>
<text x="-3.81" y="-10.16" size="1.778" layer="94">&gt;VALUE</text>
</symbol>
<symbol name="VOLTAGE_REGULATOR">
<pin name="IN" x="-10.16" y="2.54" visible="off" length="middle" direction="pwr"/>
<pin name="GND" x="0" y="-7.62" visible="off" length="middle" direction="pwr" rot="R90"/>
<pin name="OUT" x="10.16" y="2.54" visible="off" length="middle" direction="sup" rot="R180"/>
<wire x1="-5.08" y1="5.08" x2="-5.08" y2="-2.54" width="0.254" layer="94"/>
<wire x1="-5.08" y1="-2.54" x2="5.08" y2="-2.54" width="0.254" layer="94"/>
<wire x1="5.08" y1="-2.54" x2="5.08" y2="5.08" width="0.254" layer="94"/>
<wire x1="5.08" y1="5.08" x2="-5.08" y2="5.08" width="0.254" layer="94"/>
<text x="-2.54" y="10.16" size="1.778" layer="94">&gt;NAME</text>
<text x="-2.54" y="7.62" size="1.778" layer="94">&gt;VALUE</text>
<text x="-3.81" y="2.54" size="1.778" layer="94">in</text>
<text x="-2.54" y="-1.27" size="1.778" layer="94">GND</text>
<text x="1.27" y="2.54" size="1.778" layer="94">out</text>
</symbol>
<symbol name="BME280">
<pin name="GND" x="-10.16" y="2.54" length="middle" direction="sup"/>
<pin name="SCL" x="-10.16" y="0" length="middle"/>
<pin name="SDA" x="-10.16" y="-2.54" length="middle"/>
<pin name="VCC" x="-10.16" y="5.08" length="middle" direction="sup"/>
<wire x1="-5.08" y1="7.62" x2="-5.08" y2="-5.08" width="0.254" layer="94"/>
<wire x1="-5.08" y1="-5.08" x2="22.86" y2="-5.08" width="0.254" layer="94"/>
<wire x1="22.86" y1="-5.08" x2="22.86" y2="7.62" width="0.254" layer="94"/>
<wire x1="22.86" y1="7.62" x2="-5.08" y2="7.62" width="0.254" layer="94"/>
<text x="7.62" y="0" size="1.778" layer="94">BME280</text>
<text x="5.08" y="10.16" size="1.778" layer="94">&gt;NAME</text>
</symbol>
<symbol name="GY-SGP30">
<pin name="VIN" x="-7.62" y="2.54" length="middle" direction="pwr"/>
<pin name="GND" x="-7.62" y="0" length="middle" direction="sup"/>
<pin name="SCL" x="-7.62" y="-2.54" length="middle"/>
<pin name="SDA" x="-7.62" y="-5.08" length="middle"/>
<wire x1="-2.54" y1="7.62" x2="-2.54" y2="-10.16" width="0.254" layer="94"/>
<wire x1="-2.54" y1="-10.16" x2="12.7" y2="-10.16" width="0.254" layer="94"/>
<wire x1="12.7" y1="-10.16" x2="12.7" y2="7.62" width="0.254" layer="94"/>
<wire x1="12.7" y1="7.62" x2="-2.54" y2="7.62" width="0.254" layer="94"/>
<text x="-2.54" y="10.16" size="1.778" layer="94">&gt;NAME</text>
</symbol>
<symbol name="MSGEQ7">
<pin name="VCC" x="-10.16" y="7.62" visible="off" length="middle" direction="pwr"/>
<pin name="GND" x="-10.16" y="2.54" visible="off" length="middle" direction="pwr"/>
<pin name="OUT" x="-10.16" y="-2.54" visible="off" length="middle" direction="out"/>
<pin name="STROBE" x="-10.16" y="-7.62" visible="off" length="middle" direction="in"/>
<pin name="CKIN" x="10.16" y="7.62" visible="off" length="middle" direction="in" rot="R180"/>
<pin name="RESET" x="10.16" y="2.54" visible="off" length="middle" direction="in" rot="R180"/>
<pin name="IGND" x="10.16" y="-2.54" visible="off" length="middle" rot="R180"/>
<pin name="IN" x="10.16" y="-7.62" visible="off" length="middle" direction="in" rot="R180"/>
<wire x1="-5.08" y1="10.16" x2="-5.08" y2="-10.16" width="0.254" layer="94"/>
<wire x1="-5.08" y1="-10.16" x2="5.08" y2="-10.16" width="0.254" layer="94"/>
<wire x1="5.08" y1="-10.16" x2="5.08" y2="10.16" width="0.254" layer="94"/>
<wire x1="5.08" y1="10.16" x2="-5.08" y2="10.16" width="0.254" layer="94"/>
<text x="-5.08" y="12.7" size="1.778" layer="94">&gt;NAME</text>
<text x="-5.08" y="-15.24" size="1.778" layer="94">&gt;VALUE</text>
<text x="-3.81" y="7.62" size="0.6096" layer="94">VCC</text>
<text x="-3.81" y="2.54" size="0.6096" layer="94">GND</text>
<text x="-3.81" y="-2.54" size="0.6096" layer="94">OUT</text>
<text x="-3.81" y="-7.62" size="0.6096" layer="94">STROBE</text>
<text x="1.905" y="7.62" size="0.6096" layer="94">CKIN</text>
<text x="1.27" y="2.54" size="0.6096" layer="94">RESET</text>
<text x="1.905" y="-2.54" size="0.6096" layer="94">I_GND</text>
<text x="3.175" y="-7.62" size="0.6096" layer="94">IN</text>
</symbol>
<symbol name="C-1">
<pin name="P$1" x="-7.62" y="0" visible="off" length="middle"/>
<pin name="P$2" x="7.62" y="0" visible="off" length="middle" rot="R180"/>
<wire x1="-2.54" y1="0" x2="-0.635" y2="0" width="0.254" layer="94"/>
<wire x1="2.54" y1="0" x2="0.635" y2="0" width="0.254" layer="94"/>
<wire x1="0.635" y1="2.54" x2="0.635" y2="-2.54" width="0.254" layer="94"/>
<wire x1="-0.635" y1="2.54" x2="-0.635" y2="-2.54" width="0.254" layer="94"/>
<text x="-4.445" y="3.175" size="1.778" layer="94">&gt;NAME</text>
<text x="-4.445" y="-5.08" size="1.778" layer="94">&gt;VALUE</text>
</symbol>
<symbol name="MICROPHONE">
<circle x="0" y="0" radius="5.08" width="0.254" layer="94"/>
<wire x1="5.08" y1="5.08" x2="5.08" y2="-5.08" width="0.254" layer="94"/>
<pin name="P$1" x="-10.16" y="2.54" visible="off" length="middle"/>
<pin name="P$2" x="-10.16" y="-2.54" visible="off" length="middle"/>
<wire x1="-5.08" y1="2.54" x2="-4.445" y2="2.54" width="0.254" layer="94"/>
<wire x1="-5.08" y1="-2.54" x2="-4.445" y2="-2.54" width="0.254" layer="94"/>
<text x="7.62" y="2.54" size="1.778" layer="94">&gt;NAME</text>
<text x="7.62" y="-2.54" size="1.778" layer="94">&gt;VALUE</text>
</symbol>
<symbol name="X">
<wire x1="-0.635" y1="1.905" x2="-0.635" y2="-1.905" width="0.254" layer="94"/>
<wire x1="-0.635" y1="-1.905" x2="0.635" y2="-1.905" width="0.254" layer="94"/>
<wire x1="0.635" y1="-1.905" x2="0.635" y2="1.905" width="0.254" layer="94"/>
<wire x1="0.635" y1="1.905" x2="-0.635" y2="1.905" width="0.254" layer="94"/>
<wire x1="-1.27" y1="1.905" x2="-1.27" y2="-1.905" width="0.254" layer="94"/>
<wire x1="1.27" y1="1.905" x2="1.27" y2="-1.905" width="0.254" layer="94"/>
<pin name="P$1" x="-6.35" y="0" visible="off" length="middle"/>
<pin name="P$2" x="6.35" y="0" visible="off" length="middle" rot="R180"/>
<text x="-5.08" y="2.54" size="1.778" layer="94">&gt;NAME</text>
<text x="-5.08" y="-4.445" size="1.778" layer="94">&gt;VALUE</text>
</symbol>
<symbol name="L-2">
<wire x1="0" y1="0" x2="0" y2="2.54" width="0.254" layer="94" curve="-180"/>
<wire x1="0" y1="-2.54" x2="0" y2="0" width="0.254" layer="94" curve="-180"/>
<wire x1="0" y1="-5.08" x2="0" y2="-2.54" width="0.254" layer="94" curve="-180"/>
<wire x1="0" y1="-7.62" x2="0" y2="-5.08" width="0.254" layer="94" curve="-180"/>
<wire x1="0" y1="5.08" x2="0" y2="7.62" width="0.254" layer="94" curve="-180"/>
<wire x1="0" y1="7.62" x2="0" y2="10.16" width="0.254" layer="94" curve="-180"/>
<wire x1="0" y1="10.16" x2="0" y2="12.7" width="0.254" layer="94" curve="-180"/>
<wire x1="0" y1="12.7" x2="0" y2="15.24" width="0.254" layer="94" curve="-180"/>
<wire x1="-2.54" y1="15.24" x2="-2.54" y2="-7.62" width="0.254" layer="94"/>
<pin name="L1-1" x="5.08" y="15.24" visible="off" length="middle" rot="R180"/>
<pin name="L1-2" x="5.08" y="5.08" visible="off" length="middle" rot="R180"/>
<pin name="L2-1" x="5.08" y="2.54" visible="off" length="middle" rot="R180"/>
<pin name="L2-2" x="5.08" y="-7.62" visible="off" length="middle" rot="R180"/>
<text x="-12.7" y="5.08" size="1.778" layer="94">&gt;NAME</text>
<text x="-12.7" y="0" size="1.778" layer="94">&gt;VALUE</text>
<pin name="NC" x="5.08" y="-10.16" visible="off" length="middle" direction="nc" rot="R180"/>
</symbol>
<symbol name="433MHZ_TRANSMITTER">
<pin name="VCC" x="-5.08" y="2.54" length="middle" direction="pwr"/>
<pin name="DATA" x="-5.08" y="0" length="middle" direction="in"/>
<pin name="GND" x="-5.08" y="-2.54" length="middle" direction="pwr"/>
<wire x1="0" y1="5.08" x2="0" y2="-5.08" width="0.254" layer="94"/>
<wire x1="0" y1="-5.08" x2="12.7" y2="-5.08" width="0.254" layer="94"/>
<wire x1="12.7" y1="-5.08" x2="12.7" y2="5.08" width="0.254" layer="94"/>
<wire x1="12.7" y1="5.08" x2="0" y2="5.08" width="0.254" layer="94"/>
<text x="2.54" y="7.62" size="1.778" layer="94">&gt;NAME</text>
<text x="2.54" y="-10.16" size="1.778" layer="94">&gt;VALUE</text>
</symbol>
<symbol name="L-3">
<wire x1="0" y1="0" x2="0" y2="2.54" width="0.254" layer="94" curve="-180"/>
<wire x1="0" y1="-2.54" x2="0" y2="0" width="0.254" layer="94" curve="-180"/>
<wire x1="0" y1="-5.08" x2="0" y2="-2.54" width="0.254" layer="94" curve="-180"/>
<wire x1="0" y1="-7.62" x2="0" y2="-5.08" width="0.254" layer="94" curve="-180"/>
<wire x1="0" y1="5.08" x2="0" y2="7.62" width="0.254" layer="94" curve="-180"/>
<wire x1="0" y1="7.62" x2="0" y2="10.16" width="0.254" layer="94" curve="-180"/>
<wire x1="0" y1="10.16" x2="0" y2="12.7" width="0.254" layer="94" curve="-180"/>
<wire x1="0" y1="12.7" x2="0" y2="15.24" width="0.254" layer="94" curve="-180"/>
<wire x1="-2.54" y1="15.24" x2="-2.54" y2="-7.62" width="0.254" layer="94"/>
<pin name="L1-1" x="5.08" y="15.24" visible="off" length="middle" rot="R180"/>
<pin name="L1-2" x="5.08" y="10.16" visible="off" length="middle" rot="R180"/>
<pin name="L2-1" x="5.08" y="2.54" visible="off" length="middle" rot="R180"/>
<pin name="L2-2" x="5.08" y="-7.62" visible="off" length="middle" rot="R180"/>
<text x="-12.7" y="5.08" size="1.778" layer="94">&gt;NAME</text>
<text x="-12.7" y="0" size="1.778" layer="94">&gt;VALUE</text>
<pin name="L1-3" x="5.08" y="5.08" visible="off" length="middle" rot="R180"/>
<circle x="0.3175" y="14.605" radius="0.3175" width="0.254" layer="94"/>
<circle x="0.3175" y="9.525" radius="0.3175" width="0.254" layer="94"/>
</symbol>
<symbol name="MOSFET_N">
<wire x1="1.27" y1="2.54" x2="1.27" y2="-2.54" width="0.254" layer="94"/>
<wire x1="0.635" y1="2.54" x2="0.635" y2="1.905" width="0.254" layer="94"/>
<wire x1="0.635" y1="1.905" x2="0.635" y2="1.27" width="0.254" layer="94"/>
<wire x1="0.635" y1="0.635" x2="0.635" y2="0" width="0.254" layer="94"/>
<wire x1="0.635" y1="0" x2="0.635" y2="-0.635" width="0.254" layer="94"/>
<wire x1="0.635" y1="-1.27" x2="0.635" y2="-1.905" width="0.254" layer="94"/>
<pin name="G" x="6.35" y="-2.54" visible="off" length="middle" rot="R180"/>
<circle x="-0.635" y="0" radius="5.11953125" width="0.254" layer="94"/>
<wire x1="0.635" y1="-1.905" x2="0.635" y2="-2.54" width="0.254" layer="94"/>
<pin name="D" x="-2.54" y="6.985" visible="off" length="middle" rot="R270"/>
<pin name="S" x="-2.54" y="-6.985" visible="off" length="middle" rot="R90"/>
<wire x1="-2.54" y1="-1.905" x2="0.635" y2="-1.905" width="0.254" layer="94"/>
<wire x1="-2.54" y1="0" x2="0.635" y2="0" width="0.254" layer="94"/>
<polygon width="0.254" layer="94">
<vertex x="0.635" y="0"/>
<vertex x="-0.635" y="0.635"/>
<vertex x="-0.635" y="-0.635"/>
</polygon>
<wire x1="-4.445" y1="1.27" x2="-3.81" y2="1.27" width="0.254" layer="94"/>
<polygon width="0.254" layer="94">
<vertex x="-3.81" y="1.27"/>
<vertex x="-4.445" y="-0.635"/>
<vertex x="-3.175" y="-0.635"/>
</polygon>
<wire x1="-3.81" y1="1.27" x2="-3.175" y2="1.27" width="0.254" layer="94"/>
<wire x1="-3.81" y1="1.27" x2="-3.81" y2="3.175" width="0.254" layer="94"/>
<wire x1="-3.81" y1="-0.635" x2="-3.81" y2="-3.175" width="0.254" layer="94"/>
<wire x1="-2.54" y1="-1.905" x2="-2.54" y2="0" width="0.254" layer="94"/>
<wire x1="-2.54" y1="1.905" x2="0.635" y2="1.905" width="0.254" layer="94"/>
<wire x1="-3.81" y1="-3.175" x2="-2.54" y2="-3.175" width="0.254" layer="94"/>
<wire x1="-3.81" y1="3.175" x2="-2.54" y2="3.175" width="0.254" layer="94"/>
<text x="-16.51" y="2.54" size="1.778" layer="94">&gt;NAME</text>
<text x="-16.51" y="-5.08" size="1.778" layer="94">&gt;VALUE</text>
</symbol>
<symbol name="SERVO">
<wire x1="-5.08" y1="7.62" x2="-5.08" y2="-7.62" width="0.254" layer="94"/>
<wire x1="-5.08" y1="-7.62" x2="8.89" y2="-7.62" width="0.254" layer="94"/>
<wire x1="8.89" y1="-7.62" x2="8.89" y2="7.62" width="0.254" layer="94"/>
<wire x1="8.89" y1="7.62" x2="-5.08" y2="7.62" width="0.254" layer="94"/>
<circle x="5.715" y="0.635" radius="2.54" width="0.254" layer="94"/>
<wire x1="5.715" y1="3.175" x2="15.24" y2="6.35" width="0.254" layer="94"/>
<wire x1="15.24" y1="6.35" x2="16.51" y2="4.445" width="0.254" layer="94" curve="-137.726311"/>
<wire x1="7.62" y1="-1.27" x2="16.51" y2="4.445" width="0.254" layer="94"/>
<pin name="PULSE" x="-10.16" y="5.08" length="middle" direction="in"/>
<pin name="VCC" x="-10.16" y="0" length="middle" direction="pwr"/>
<pin name="GND" x="-10.16" y="-5.08" length="middle" direction="pwr"/>
<text x="-2.54" y="-10.16" size="1.778" layer="94">&gt;VALUE</text>
<text x="-2.54" y="10.16" size="1.778" layer="94">&gt;NAME</text>
</symbol>
<symbol name="CD4047">
<pin name="AST_" x="-10.16" y="0" visible="off" length="middle"/>
<pin name="RC" x="-10.16" y="2.54" visible="off" length="middle"/>
<pin name="R" x="-10.16" y="5.08" visible="off" length="middle"/>
<pin name="AST" x="-10.16" y="-2.54" visible="off" length="middle"/>
<pin name="-TRG" x="-10.16" y="-5.08" visible="off" length="middle"/>
<pin name="GND" x="-10.16" y="-7.62" visible="off" length="middle" direction="pwr"/>
<pin name="C" x="-10.16" y="7.62" visible="off" length="middle"/>
<pin name="VCC" x="10.16" y="7.62" visible="off" length="middle" direction="pwr" rot="R180"/>
<pin name="OSC_OUT" x="10.16" y="5.08" visible="off" length="middle" direction="out" rot="R180"/>
<pin name="RE_TRG" x="10.16" y="2.54" visible="off" length="middle" rot="R180"/>
<pin name="Q_" x="10.16" y="0" visible="off" length="middle" direction="out" rot="R180"/>
<pin name="Q" x="10.16" y="-2.54" visible="off" length="middle" direction="out" rot="R180"/>
<pin name="EXT_RESET" x="10.16" y="-5.08" visible="off" length="middle" rot="R180"/>
<pin name="+TRG" x="10.16" y="-7.62" visible="off" length="middle" rot="R180"/>
<wire x1="-5.08" y1="10.16" x2="-5.08" y2="-10.16" width="0.254" layer="94"/>
<wire x1="-5.08" y1="-10.16" x2="5.08" y2="-10.16" width="0.254" layer="94"/>
<wire x1="5.08" y1="-10.16" x2="5.08" y2="10.16" width="0.254" layer="94"/>
<wire x1="5.08" y1="10.16" x2="-5.08" y2="10.16" width="0.254" layer="94"/>
<text x="-4.445" y="7.62" size="0.8128" layer="94">C</text>
<text x="-4.445" y="5.08" size="0.8128" layer="94">R</text>
<text x="-4.445" y="2.54" size="0.8128" layer="94">RC</text>
<text x="-4.445" y="0" size="0.8128" layer="94">ASTBL__</text>
<text x="-4.445" y="-2.54" size="0.8128" layer="94">ASTBL</text>
<text x="-4.445" y="-5.08" size="0.8128" layer="94">- TRG</text>
<text x="-4.445" y="-7.62" size="0.8128" layer="94">GND</text>
<text x="1.905" y="7.62" size="0.8128" layer="94">VCC</text>
<text x="-0.635" y="5.08" size="0.8128" layer="94">OSC OUT</text>
<text x="0" y="2.54" size="0.8128" layer="94">RE-RTG</text>
<text x="2.54" y="0" size="0.8128" layer="94">Q__</text>
<text x="2.54" y="-2.54" size="0.8128" layer="94">Q</text>
<text x="-0.635" y="-5.08" size="0.8128" layer="94">EXT_RST</text>
<text x="0.635" y="-7.62" size="0.8128" layer="94">+ TRG</text>
<text x="-3.81" y="10.795" size="1.778" layer="94">&gt;NAME</text>
<text x="-4.445" y="-12.7" size="1.778" layer="94">&gt;VALUE</text>
</symbol>
<symbol name="RD">
<pin name="P1" x="-7.62" y="0" visible="off" length="middle"/>
<pin name="P2" x="7.62" y="0" visible="off" length="middle" rot="R180"/>
<pin name="P3" x="0" y="7.62" visible="off" length="middle" rot="R270"/>
<wire x1="-2.54" y1="1.27" x2="-2.54" y2="-1.27" width="0.254" layer="94"/>
<wire x1="-2.54" y1="-1.27" x2="2.54" y2="-1.27" width="0.254" layer="94"/>
<wire x1="2.54" y1="-1.27" x2="2.54" y2="1.27" width="0.254" layer="94"/>
<wire x1="2.54" y1="1.27" x2="0" y2="1.27" width="0.254" layer="94"/>
<wire x1="-2.54" y1="1.27" x2="0" y2="1.27" width="0.254" layer="94"/>
<wire x1="0" y1="1.27" x2="0" y2="2.54" width="0.254" layer="94"/>
<polygon width="0.254" layer="94">
<vertex x="-0.635" y="2.54"/>
<vertex x="0" y="1.27"/>
<vertex x="0.635" y="2.54"/>
</polygon>
<text x="-4.445" y="-3.81" size="1.778" layer="94">&gt;NAME</text>
<text x="-5.08" y="-6.35" size="1.778" layer="94">&gt;VALUE</text>
</symbol>
<symbol name="HALL_SENSOR">
<pin name="OUT" x="-7.62" y="0" visible="off" length="middle"/>
<pin name="GND" x="0" y="-7.62" visible="off" length="middle" direction="sup" rot="R90"/>
<pin name="VCC" x="0" y="7.62" visible="off" length="middle" direction="sup" rot="R270"/>
<wire x1="-2.54" y1="2.54" x2="-2.54" y2="-2.54" width="0.254" layer="94"/>
<wire x1="-2.54" y1="-2.54" x2="2.54" y2="-2.54" width="0.254" layer="94"/>
<wire x1="2.54" y1="-2.54" x2="2.54" y2="2.54" width="0.254" layer="94"/>
<wire x1="2.54" y1="2.54" x2="-2.54" y2="2.54" width="0.254" layer="94"/>
<wire x1="-2.54" y1="2.54" x2="2.54" y2="-2.54" width="0.254" layer="94"/>
<wire x1="2.54" y1="2.54" x2="-2.54" y2="-2.54" width="0.254" layer="94"/>
<text x="2.54" y="5.08" size="1.778" layer="94">VCC</text>
<text x="2.54" y="-5.08" size="1.778" layer="94">GND</text>
<text x="-10.16" y="-2.54" size="1.778" layer="94">OUT</text>
<text x="7.62" y="0" size="1.778" layer="94">&gt;NAME</text>
<text x="7.62" y="-2.54" size="1.778" layer="94">&gt;VALUE</text>
</symbol>
<symbol name="TRANSISTOR_PNP">
<pin name="B" x="-7.62" y="0" visible="off" length="middle"/>
<pin name="C" x="0" y="7.62" visible="off" length="middle" rot="R270"/>
<pin name="E" x="0" y="-7.62" visible="off" length="middle" rot="R90"/>
<circle x="0" y="0" radius="3.81" width="0.254" layer="94"/>
<wire x1="-2.54" y1="2.54" x2="-2.54" y2="0" width="0.254" layer="94"/>
<wire x1="-2.54" y1="0" x2="-2.54" y2="-2.54" width="0.254" layer="94"/>
<wire x1="0" y1="2.54" x2="-2.54" y2="0" width="0.254" layer="94"/>
<wire x1="0" y1="-2.54" x2="-2.54" y2="0" width="0.254" layer="94"/>
<text x="3.81" y="1.27" size="1.778" layer="94">&gt;NAME</text>
<text x="3.81" y="-2.54" size="1.778" layer="94">&gt;VALUE</text>
<polygon width="0.254" layer="94">
<vertex x="-2.032" y="-0.508"/>
<vertex x="-1.016" y="-0.508"/>
<vertex x="-2.032" y="-1.524"/>
</polygon>
</symbol>
</symbols>
<devicesets>
<deviceset name="ACDC" prefix="ACDC">
<gates>
<gate name="G$1" symbol="ACDC" x="0" y="0"/>
</gates>
<devices>
<device name="" package="ACDC">
<connects>
<connect gate="G$1" pin="220V_L" pad="220V_L"/>
<connect gate="G$1" pin="220V_N" pad="220V_N"/>
<connect gate="G$1" pin="OUT_5V" pad="+5V"/>
<connect gate="G$1" pin="OUT_GND" pad="GND"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
<deviceset name="ESP32" prefix="U">
<gates>
<gate name="G$1" symbol="ESP32" x="0" y="0"/>
</gates>
<devices>
<device name="" package="ESP32">
<connects>
<connect gate="G$1" pin="3V3" pad="3V3"/>
<connect gate="G$1" pin="5V" pad="+5V"/>
<connect gate="G$1" pin="CLK" pad="CLK"/>
<connect gate="G$1" pin="CMD" pad="CMD"/>
<connect gate="G$1" pin="EN" pad="EN"/>
<connect gate="G$1" pin="GND" pad="GND"/>
<connect gate="G$1" pin="GND_1" pad="GND_1"/>
<connect gate="G$1" pin="GND_2" pad="GND_2"/>
<connect gate="G$1" pin="IO0" pad="IO0"/>
<connect gate="G$1" pin="IO12" pad="IO12"/>
<connect gate="G$1" pin="IO13" pad="IO13"/>
<connect gate="G$1" pin="IO14" pad="IO14"/>
<connect gate="G$1" pin="IO15" pad="IO15"/>
<connect gate="G$1" pin="IO16" pad="IO16"/>
<connect gate="G$1" pin="IO17" pad="IO17"/>
<connect gate="G$1" pin="IO18" pad="IO18"/>
<connect gate="G$1" pin="IO19" pad="IO19"/>
<connect gate="G$1" pin="IO2" pad="IO2"/>
<connect gate="G$1" pin="IO21" pad="IO21"/>
<connect gate="G$1" pin="IO22" pad="IO22"/>
<connect gate="G$1" pin="IO23" pad="IO23"/>
<connect gate="G$1" pin="IO25" pad="IO25"/>
<connect gate="G$1" pin="IO26" pad="IO26"/>
<connect gate="G$1" pin="IO27" pad="IO27"/>
<connect gate="G$1" pin="IO32" pad="IO32"/>
<connect gate="G$1" pin="IO33" pad="IO33"/>
<connect gate="G$1" pin="IO34" pad="IO34"/>
<connect gate="G$1" pin="IO35" pad="IO35"/>
<connect gate="G$1" pin="IO4" pad="IO4"/>
<connect gate="G$1" pin="IO5" pad="IO5"/>
<connect gate="G$1" pin="RXD0" pad="RXD"/>
<connect gate="G$1" pin="SD0" pad="SD0"/>
<connect gate="G$1" pin="SD1" pad="SD1"/>
<connect gate="G$1" pin="SD2" pad="SD2"/>
<connect gate="G$1" pin="SD3" pad="SD3"/>
<connect gate="G$1" pin="SVN" pad="SVN"/>
<connect gate="G$1" pin="SVP" pad="SVP"/>
<connect gate="G$1" pin="TXD0" pad="TXD0"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
<deviceset name="R" prefix="R">
<gates>
<gate name="G$1" symbol="R" x="0" y="0"/>
</gates>
<devices>
<device name="" package="R">
<connects>
<connect gate="G$1" pin="P$1" pad="P$1"/>
<connect gate="G$1" pin="P$2" pad="P$2"/>
</connects>
<technologies>
<technology name="">
<attribute name="R" value="" constant="no"/>
</technology>
</technologies>
</device>
</devices>
</deviceset>
<deviceset name="TRANSISTOR_NPN" prefix="Q" uservalue="yes">
<gates>
<gate name="G$1" symbol="TRANSISTOR_NPN" x="0" y="0"/>
</gates>
<devices>
<device name="" package="TRANSISTOR">
<connects>
<connect gate="G$1" pin="B" pad="B"/>
<connect gate="G$1" pin="C" pad="C"/>
<connect gate="G$1" pin="E" pad="E"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
<deviceset name="SWITCH" prefix="SW">
<gates>
<gate name="G$1" symbol="SWITCH" x="0" y="0"/>
</gates>
<devices>
<device name="" package="SWITCH">
<connects>
<connect gate="G$1" pin="P$1" pad="P$1"/>
<connect gate="G$1" pin="P$2" pad="P$2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
<deviceset name="TOUCH_SENSOR" prefix="TS">
<gates>
<gate name="G$1" symbol="TOUCH_SENSOR" x="0" y="0"/>
</gates>
<devices>
<device name="" package="TOUCH_SENSOR">
<connects>
<connect gate="G$1" pin="P$1" pad="P$1"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
<deviceset name="RGBLED" prefix="D">
<gates>
<gate name="G$1" symbol="RGBLED" x="-10.16" y="7.62"/>
</gates>
<devices>
<device name="" package="RGBLED">
<connects>
<connect gate="G$1" pin="GND" pad="GND"/>
<connect gate="G$1" pin="VIN_B" pad="VIN_B"/>
<connect gate="G$1" pin="VIN_G" pad="VIN_G"/>
<connect gate="G$1" pin="VIN_R" pad="VIN_R"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
<deviceset name="C" prefix="C">
<gates>
<gate name="G$1" symbol="C" x="2.54" y="0"/>
</gates>
<devices>
<device name="" package="C">
<connects>
<connect gate="G$1" pin="PIN_GND" pad="PIN_GND"/>
<connect gate="G$1" pin="PIN_PLUS" pad="PIN_PLUS"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
<deviceset name="DIODE_BRIDGE" prefix="D">
<gates>
<gate name="G$1" symbol="DIODE_BRIDGE" x="0" y="0"/>
</gates>
<devices>
<device name="" package="DIODE_BRIDGE">
<connects>
<connect gate="G$1" pin="AC1" pad="AC1"/>
<connect gate="G$1" pin="AC2" pad="AC2"/>
<connect gate="G$1" pin="GND" pad="GND"/>
<connect gate="G$1" pin="VCC" pad="VCC"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
<deviceset name="VOLTAGE_REGULATOR" prefix="U">
<gates>
<gate name="G$1" symbol="VOLTAGE_REGULATOR" x="0" y="0"/>
</gates>
<devices>
<device name="" package="VOLTAGE_REGULATOR">
<connects>
<connect gate="G$1" pin="GND" pad="GND"/>
<connect gate="G$1" pin="IN" pad="IN"/>
<connect gate="G$1" pin="OUT" pad="OUT"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
<deviceset name="BME280" prefix="U">
<gates>
<gate name="G$1" symbol="BME280" x="-10.16" y="0"/>
</gates>
<devices>
<device name="" package="BME280">
<connects>
<connect gate="G$1" pin="GND" pad="GND"/>
<connect gate="G$1" pin="SCL" pad="SCL"/>
<connect gate="G$1" pin="SDA" pad="SDA"/>
<connect gate="G$1" pin="VCC" pad="VCC"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
<deviceset name="GY-SGP30" prefix="U">
<gates>
<gate name="G$1" symbol="GY-SGP30" x="-5.08" y="0"/>
</gates>
<devices>
<device name="" package="GY-SGP30">
<connects>
<connect gate="G$1" pin="GND" pad="GND"/>
<connect gate="G$1" pin="SCL" pad="SCL"/>
<connect gate="G$1" pin="SDA" pad="SDA"/>
<connect gate="G$1" pin="VIN" pad="VIN"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
<deviceset name="MSGEQ7" prefix="U">
<gates>
<gate name="G$1" symbol="MSGEQ7" x="0" y="0"/>
</gates>
<devices>
<device name="" package="MSGEQ7">
<connects>
<connect gate="G$1" pin="CKIN" pad="CKIN"/>
<connect gate="G$1" pin="GND" pad="GND"/>
<connect gate="G$1" pin="IGND" pad="IGND"/>
<connect gate="G$1" pin="IN" pad="IN"/>
<connect gate="G$1" pin="OUT" pad="OUT"/>
<connect gate="G$1" pin="RESET" pad="RESET"/>
<connect gate="G$1" pin="STROBE" pad="STROBE"/>
<connect gate="G$1" pin="VCC" pad="VCC"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
<deviceset name="C-1" prefix="C">
<gates>
<gate name="G$1" symbol="C-1" x="0" y="0"/>
</gates>
<devices>
<device name="" package="C-1">
<connects>
<connect gate="G$1" pin="P$1" pad="P$1"/>
<connect gate="G$1" pin="P$2" pad="P$2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
<deviceset name="MICROPHONE" prefix="BM">
<gates>
<gate name="G$1" symbol="MICROPHONE" x="0" y="0"/>
</gates>
<devices>
<device name="" package="MICROPHONE">
<connects>
<connect gate="G$1" pin="P$1" pad="P$1"/>
<connect gate="G$1" pin="P$2" pad="P$2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
<deviceset name="X" prefix="X">
<gates>
<gate name="G$1" symbol="X" x="0" y="0"/>
</gates>
<devices>
<device name="" package="X">
<connects>
<connect gate="G$1" pin="P$1" pad="P$1"/>
<connect gate="G$1" pin="P$2" pad="P$2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
<deviceset name="L-2" prefix="L">
<gates>
<gate name="G$1" symbol="L-2" x="2.54" y="-5.08"/>
</gates>
<devices>
<device name="" package="L-2">
<connects>
<connect gate="G$1" pin="L1-1" pad="L1-1"/>
<connect gate="G$1" pin="L1-2" pad="L1-2"/>
<connect gate="G$1" pin="L2-1" pad="L2-1"/>
<connect gate="G$1" pin="L2-2" pad="L2-2"/>
<connect gate="G$1" pin="NC" pad="NC"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
<deviceset name="433MHZ_TRANSMITTER" prefix="U">
<gates>
<gate name="G$1" symbol="433MHZ_TRANSMITTER" x="-7.62" y="0"/>
</gates>
<devices>
<device name="" package="433MHZ_TRANSMITTER">
<connects>
<connect gate="G$1" pin="DATA" pad="DATA"/>
<connect gate="G$1" pin="GND" pad="GND"/>
<connect gate="G$1" pin="VCC" pad="VCC"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
<deviceset name="L-3" prefix="L">
<gates>
<gate name="G$1" symbol="L-3" x="2.54" y="-2.54"/>
</gates>
<devices>
<device name="" package="L-3">
<connects>
<connect gate="G$1" pin="L1-1" pad="L1-1"/>
<connect gate="G$1" pin="L1-2" pad="L1-2"/>
<connect gate="G$1" pin="L1-3" pad="L1-3"/>
<connect gate="G$1" pin="L2-1" pad="L2-1"/>
<connect gate="G$1" pin="L2-2" pad="L2-2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
<deviceset name="MOSFET_N" prefix="Q">
<gates>
<gate name="G$1" symbol="MOSFET_N" x="-1.27" y="0"/>
</gates>
<devices>
<device name="" package="MOSFET_N">
<connects>
<connect gate="G$1" pin="D" pad="D"/>
<connect gate="G$1" pin="G" pad="G"/>
<connect gate="G$1" pin="S" pad="S"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
<deviceset name="SERVO" prefix="J">
<gates>
<gate name="G$1" symbol="SERVO" x="0" y="0"/>
</gates>
<devices>
<device name="" package="SERVO">
<connects>
<connect gate="G$1" pin="GND" pad="GND"/>
<connect gate="G$1" pin="PULSE" pad="PULSE"/>
<connect gate="G$1" pin="VCC" pad="VCC"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
<deviceset name="CD4047" prefix="U">
<gates>
<gate name="G$1" symbol="CD4047" x="0" y="0"/>
</gates>
<devices>
<device name="" package="CD4047">
<connects>
<connect gate="G$1" pin="+TRG" pad="+TRIGGER"/>
<connect gate="G$1" pin="-TRG" pad="-TRIGGER"/>
<connect gate="G$1" pin="AST" pad="ASTABLE"/>
<connect gate="G$1" pin="AST_" pad="ASTABLE__"/>
<connect gate="G$1" pin="C" pad="C"/>
<connect gate="G$1" pin="EXT_RESET" pad="EXT..RESET"/>
<connect gate="G$1" pin="GND" pad="GND"/>
<connect gate="G$1" pin="OSC_OUT" pad="OSCOUT"/>
<connect gate="G$1" pin="Q" pad="Q"/>
<connect gate="G$1" pin="Q_" pad="Q__"/>
<connect gate="G$1" pin="R" pad="R"/>
<connect gate="G$1" pin="RC" pad="RC"/>
<connect gate="G$1" pin="RE_TRG" pad="RETRIGGER"/>
<connect gate="G$1" pin="VCC" pad="VCC"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
<deviceset name="RD" prefix="R">
<gates>
<gate name="G$1" symbol="RD" x="0" y="0"/>
</gates>
<devices>
<device name="" package="RD">
<connects>
<connect gate="G$1" pin="P1" pad="P1"/>
<connect gate="G$1" pin="P2" pad="P2"/>
<connect gate="G$1" pin="P3" pad="P3"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
<deviceset name="HALL_SENSOR" prefix="B">
<gates>
<gate name="G$1" symbol="HALL_SENSOR" x="0" y="0"/>
</gates>
<devices>
<device name="" package="HALL_SENSOR">
<connects>
<connect gate="G$1" pin="GND" pad="GND"/>
<connect gate="G$1" pin="OUT" pad="OUT"/>
<connect gate="G$1" pin="VCC" pad="VCC"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
<deviceset name="TRANSISTOR_PNP" prefix="Q" uservalue="yes">
<gates>
<gate name="G$1" symbol="TRANSISTOR_PNP" x="0" y="0"/>
</gates>
<devices>
<device name="" package="TRANSISTOR">
<connects>
<connect gate="G$1" pin="B" pad="B"/>
<connect gate="G$1" pin="C" pad="C"/>
<connect gate="G$1" pin="E" pad="E"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
</devicesets>
</library>
<library name="supply2" urn="urn:adsk.eagle:library:372">
<description>&lt;b&gt;Supply Symbols&lt;/b&gt;&lt;p&gt;
GND, VCC, 0V, +5V, -5V, etc.&lt;p&gt;
Please keep in mind, that these devices are necessary for the
automatic wiring of the supply signals.&lt;p&gt;
The pin name defined in the symbol is identical to the net which is to be wired automatically.&lt;p&gt;
In this library the device names are the same as the pin names of the symbols, therefore the correct signal names appear next to the supply symbols in the schematic.&lt;p&gt;
&lt;author&gt;Created by librarian@cadsoft.de&lt;/author&gt;</description>
<packages>
</packages>
<symbols>
<symbol name="VCC" urn="urn:adsk.eagle:symbol:26997/1" library_version="2">
<circle x="0" y="1.27" radius="1.27" width="0.254" layer="94"/>
<text x="-1.905" y="3.175" size="1.778" layer="96">&gt;VALUE</text>
<pin name="VCC" x="0" y="-2.54" visible="off" length="short" direction="sup" rot="R90"/>
</symbol>
</symbols>
<devicesets>
<deviceset name="VCC" urn="urn:adsk.eagle:component:27060/1" prefix="SUPPLY" library_version="2">
<description>&lt;b&gt;SUPPLY SYMBOL&lt;/b&gt;</description>
<gates>
<gate name="G$1" symbol="VCC" x="0" y="0"/>
</gates>
<devices>
<device name="">
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
</devicesets>
</library>
<library name="supply1" urn="urn:adsk.eagle:library:371">
<description>&lt;b&gt;Supply Symbols&lt;/b&gt;&lt;p&gt;
 GND, VCC, 0V, +5V, -5V, etc.&lt;p&gt;
 Please keep in mind, that these devices are necessary for the
 automatic wiring of the supply signals.&lt;p&gt;
 The pin name defined in the symbol is identical to the net which is to be wired automatically.&lt;p&gt;
 In this library the device names are the same as the pin names of the symbols, therefore the correct signal names appear next to the supply symbols in the schematic.&lt;p&gt;
 &lt;author&gt;Created by librarian@cadsoft.de&lt;/author&gt;</description>
<packages>
</packages>
<symbols>
<symbol name="GND" urn="urn:adsk.eagle:symbol:26925/1" library_version="1">
<wire x1="-1.905" y1="0" x2="1.905" y2="0" width="0.254" layer="94"/>
<text x="-2.54" y="-2.54" size="1.778" layer="96">&gt;VALUE</text>
<pin name="GND" x="0" y="2.54" visible="off" length="short" direction="sup" rot="R270"/>
</symbol>
</symbols>
<devicesets>
<deviceset name="GND" urn="urn:adsk.eagle:component:26954/1" prefix="GND" library_version="1">
<description>&lt;b&gt;SUPPLY SYMBOL&lt;/b&gt;</description>
<gates>
<gate name="1" symbol="GND" x="0" y="0"/>
</gates>
<devices>
<device name="">
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
</devicesets>
</library>
<library name="atmel" urn="urn:adsk.eagle:library:105">
<description>&lt;b&gt;AVR Devices&lt;/b&gt;&lt;p&gt;
Configurable logic, microcontrollers, nonvolatile memories&lt;p&gt;
Based on the following sources:&lt;p&gt;
&lt;ul&gt;
&lt;li&gt;www.atmel.com
&lt;li&gt;CD-ROM : Configurable Logic Microcontroller Nonvolatile Memory
&lt;li&gt;CadSoft download site, www.cadsoft.de or www.cadsoftusa.com , file at90smcu_v400.zip
&lt;li&gt;avr.lbr
&lt;/ul&gt;
&lt;author&gt;Revised by librarian@cadsoft.de&lt;/author&gt;</description>
<packages>
<package name="DIL40" urn="urn:adsk.eagle:footprint:4151/1" library_version="5">
<description>&lt;B&gt;Dual In Line&lt;/B&gt;</description>
<wire x1="-26.416" y1="-1.27" x2="-26.416" y2="-6.604" width="0.1524" layer="21"/>
<wire x1="-26.416" y1="1.27" x2="-26.416" y2="-1.27" width="0.1524" layer="21" curve="-180"/>
<wire x1="26.416" y1="-6.604" x2="26.416" y2="6.604" width="0.1524" layer="21"/>
<wire x1="-26.416" y1="6.604" x2="-26.416" y2="1.27" width="0.1524" layer="21"/>
<wire x1="-26.416" y1="6.604" x2="26.416" y2="6.604" width="0.1524" layer="21"/>
<wire x1="-26.416" y1="-6.604" x2="26.416" y2="-6.604" width="0.1524" layer="21"/>
<pad name="1" x="-24.13" y="-7.62" drill="0.8128" shape="long" rot="R90"/>
<pad name="2" x="-21.59" y="-7.62" drill="0.8128" shape="long" rot="R90"/>
<pad name="3" x="-19.05" y="-7.62" drill="0.8128" shape="long" rot="R90"/>
<pad name="4" x="-16.51" y="-7.62" drill="0.8128" shape="long" rot="R90"/>
<pad name="5" x="-13.97" y="-7.62" drill="0.8128" shape="long" rot="R90"/>
<pad name="6" x="-11.43" y="-7.62" drill="0.8128" shape="long" rot="R90"/>
<pad name="7" x="-8.89" y="-7.62" drill="0.8128" shape="long" rot="R90"/>
<pad name="8" x="-6.35" y="-7.62" drill="0.8128" shape="long" rot="R90"/>
<pad name="9" x="-3.81" y="-7.62" drill="0.8128" shape="long" rot="R90"/>
<pad name="10" x="-1.27" y="-7.62" drill="0.8128" shape="long" rot="R90"/>
<pad name="11" x="1.27" y="-7.62" drill="0.8128" shape="long" rot="R90"/>
<pad name="12" x="3.81" y="-7.62" drill="0.8128" shape="long" rot="R90"/>
<pad name="13" x="6.35" y="-7.62" drill="0.8128" shape="long" rot="R90"/>
<pad name="14" x="8.89" y="-7.62" drill="0.8128" shape="long" rot="R90"/>
<pad name="15" x="11.43" y="-7.62" drill="0.8128" shape="long" rot="R90"/>
<pad name="16" x="13.97" y="-7.62" drill="0.8128" shape="long" rot="R90"/>
<pad name="17" x="16.51" y="-7.62" drill="0.8128" shape="long" rot="R90"/>
<pad name="18" x="19.05" y="-7.62" drill="0.8128" shape="long" rot="R90"/>
<pad name="19" x="21.59" y="-7.62" drill="0.8128" shape="long" rot="R90"/>
<pad name="20" x="24.13" y="-7.62" drill="0.8128" shape="long" rot="R90"/>
<pad name="21" x="24.13" y="7.62" drill="0.8128" shape="long" rot="R90"/>
<pad name="22" x="21.59" y="7.62" drill="0.8128" shape="long" rot="R90"/>
<pad name="23" x="19.05" y="7.62" drill="0.8128" shape="long" rot="R90"/>
<pad name="24" x="16.51" y="7.62" drill="0.8128" shape="long" rot="R90"/>
<pad name="25" x="13.97" y="7.62" drill="0.8128" shape="long" rot="R90"/>
<pad name="26" x="11.43" y="7.62" drill="0.8128" shape="long" rot="R90"/>
<pad name="27" x="8.89" y="7.62" drill="0.8128" shape="long" rot="R90"/>
<pad name="28" x="6.35" y="7.62" drill="0.8128" shape="long" rot="R90"/>
<pad name="29" x="3.81" y="7.62" drill="0.8128" shape="long" rot="R90"/>
<pad name="30" x="1.27" y="7.62" drill="0.8128" shape="long" rot="R90"/>
<pad name="31" x="-1.27" y="7.62" drill="0.8128" shape="long" rot="R90"/>
<pad name="32" x="-3.81" y="7.62" drill="0.8128" shape="long" rot="R90"/>
<pad name="33" x="-6.35" y="7.62" drill="0.8128" shape="long" rot="R90"/>
<pad name="34" x="-8.89" y="7.62" drill="0.8128" shape="long" rot="R90"/>
<pad name="35" x="-11.43" y="7.62" drill="0.8128" shape="long" rot="R90"/>
<pad name="36" x="-13.97" y="7.62" drill="0.8128" shape="long" rot="R90"/>
<pad name="37" x="-16.51" y="7.62" drill="0.8128" shape="long" rot="R90"/>
<pad name="38" x="-19.05" y="7.62" drill="0.8128" shape="long" rot="R90"/>
<pad name="39" x="-21.59" y="7.62" drill="0.8128" shape="long" rot="R90"/>
<pad name="40" x="-24.13" y="7.62" drill="0.8128" shape="long" rot="R90"/>
<text x="-26.67" y="-6.35" size="1.778" layer="25" ratio="10" rot="R90">&gt;NAME</text>
<text x="-21.59" y="-2.2352" size="1.778" layer="27" ratio="10">&gt;VALUE</text>
</package>
</packages>
<packages3d>
<package3d name="DIL40" urn="urn:adsk.eagle:package:4314/1" type="box" library_version="5">
<description>Dual In Line</description>
<packageinstances>
<packageinstance name="DIL40"/>
</packageinstances>
</package3d>
</packages3d>
<symbols>
<symbol name="32-I/O-M32-P" urn="urn:adsk.eagle:symbol:4247/1" library_version="5">
<wire x1="-15.24" y1="45.72" x2="15.24" y2="45.72" width="0.254" layer="94"/>
<wire x1="15.24" y1="45.72" x2="15.24" y2="-45.72" width="0.254" layer="94"/>
<wire x1="15.24" y1="-45.72" x2="-15.24" y2="-45.72" width="0.254" layer="94"/>
<wire x1="-15.24" y1="-45.72" x2="-15.24" y2="45.72" width="0.254" layer="94"/>
<text x="-15.24" y="46.482" size="1.778" layer="95">&gt;NAME</text>
<text x="-15.24" y="-48.26" size="1.778" layer="96">&gt;VALUE</text>
<pin name="(ADC7)PA7" x="20.32" y="43.18" length="middle" rot="R180"/>
<pin name="(ADC6)PA6" x="20.32" y="40.64" length="middle" rot="R180"/>
<pin name="(ADC5)PA5" x="20.32" y="38.1" length="middle" rot="R180"/>
<pin name="(ADC4)PA4" x="20.32" y="35.56" length="middle" rot="R180"/>
<pin name="(ADC3)PA3" x="20.32" y="33.02" length="middle" rot="R180"/>
<pin name="(ADC2)PA2" x="20.32" y="30.48" length="middle" rot="R180"/>
<pin name="(ADC1)PA1" x="20.32" y="27.94" length="middle" rot="R180"/>
<pin name="(ADC0)PA0" x="20.32" y="25.4" length="middle" rot="R180"/>
<pin name="(SCK)PB7" x="20.32" y="20.32" length="middle" rot="R180"/>
<pin name="(MISO)PB6" x="20.32" y="17.78" length="middle" rot="R180"/>
<pin name="(MOSI)PB5" x="20.32" y="15.24" length="middle" rot="R180"/>
<pin name="(SS)PB4" x="20.32" y="12.7" length="middle" rot="R180"/>
<pin name="(AIN1/OC0)PB3" x="20.32" y="10.16" length="middle" rot="R180"/>
<pin name="(AIN0/INT2)PB2" x="20.32" y="7.62" length="middle" rot="R180"/>
<pin name="(T1)PB1" x="20.32" y="5.08" length="middle" rot="R180"/>
<pin name="(T0/XCK)PB0" x="20.32" y="2.54" length="middle" rot="R180"/>
<pin name="(TOSC2)PC7" x="20.32" y="-2.54" length="middle" rot="R180"/>
<pin name="(TOSC1)PC6" x="20.32" y="-5.08" length="middle" rot="R180"/>
<pin name="(TDI)PC5" x="20.32" y="-7.62" length="middle" rot="R180"/>
<pin name="(TDO)PC4" x="20.32" y="-10.16" length="middle" rot="R180"/>
<pin name="(TMS)PC3" x="20.32" y="-12.7" length="middle" rot="R180"/>
<pin name="(TCK)PC2" x="20.32" y="-15.24" length="middle" rot="R180"/>
<pin name="(SDA)PC1" x="20.32" y="-17.78" length="middle" rot="R180"/>
<pin name="(SCL)PC0" x="20.32" y="-20.32" length="middle" rot="R180"/>
<pin name="GND@1" x="-20.32" y="20.32" length="middle" direction="pwr"/>
<pin name="AVCC" x="-20.32" y="22.86" length="middle" direction="pwr"/>
<pin name="AREF" x="-20.32" y="25.4" length="middle" direction="pas"/>
<pin name="XTAL1" x="-20.32" y="30.48" length="middle"/>
<pin name="XTAL2" x="-20.32" y="35.56" length="middle"/>
<pin name="VCC" x="-20.32" y="15.24" length="middle" direction="pwr"/>
<pin name="GND" x="-20.32" y="12.7" length="middle" direction="pwr"/>
<pin name="RESET" x="-20.32" y="43.18" length="middle" direction="in" function="dot"/>
<pin name="(RXD)PD0" x="20.32" y="-43.18" length="middle" rot="R180"/>
<pin name="(TXD)PD1" x="20.32" y="-40.64" length="middle" rot="R180"/>
<pin name="(INT0)PD2" x="20.32" y="-38.1" length="middle" rot="R180"/>
<pin name="(INT1)PD3" x="20.32" y="-35.56" length="middle" rot="R180"/>
<pin name="(OC1B)PD4" x="20.32" y="-33.02" length="middle" rot="R180"/>
<pin name="(OC1A)PD5" x="20.32" y="-30.48" length="middle" rot="R180"/>
<pin name="(ICP)PD6" x="20.32" y="-27.94" length="middle" rot="R180"/>
<pin name="(OC2)PD7" x="20.32" y="-25.4" length="middle" rot="R180"/>
</symbol>
</symbols>
<devicesets>
<deviceset name="MEGA32-P" urn="urn:adsk.eagle:component:4372/2" prefix="IC" library_version="5">
<description>&lt;b&gt;MICROCONTROLLER&lt;/b&gt;&lt;p&gt;
32 Kbytes FLASH&lt;br&gt;
2 Kbytes SRAM&lt;br&gt;
1 Kbytes EEPROM&lt;br&gt;
USART&lt;br&gt;
8-channel 10 bit ADC&lt;br&gt;
Source: www.atmel.com .. doc2503.pdf</description>
<gates>
<gate name="G$1" symbol="32-I/O-M32-P" x="0" y="0"/>
</gates>
<devices>
<device name="" package="DIL40">
<connects>
<connect gate="G$1" pin="(ADC0)PA0" pad="40"/>
<connect gate="G$1" pin="(ADC1)PA1" pad="39"/>
<connect gate="G$1" pin="(ADC2)PA2" pad="38"/>
<connect gate="G$1" pin="(ADC3)PA3" pad="37"/>
<connect gate="G$1" pin="(ADC4)PA4" pad="36"/>
<connect gate="G$1" pin="(ADC5)PA5" pad="35"/>
<connect gate="G$1" pin="(ADC6)PA6" pad="34"/>
<connect gate="G$1" pin="(ADC7)PA7" pad="33"/>
<connect gate="G$1" pin="(AIN0/INT2)PB2" pad="3"/>
<connect gate="G$1" pin="(AIN1/OC0)PB3" pad="4"/>
<connect gate="G$1" pin="(ICP)PD6" pad="20"/>
<connect gate="G$1" pin="(INT0)PD2" pad="16"/>
<connect gate="G$1" pin="(INT1)PD3" pad="17"/>
<connect gate="G$1" pin="(MISO)PB6" pad="7"/>
<connect gate="G$1" pin="(MOSI)PB5" pad="6"/>
<connect gate="G$1" pin="(OC1A)PD5" pad="19"/>
<connect gate="G$1" pin="(OC1B)PD4" pad="18"/>
<connect gate="G$1" pin="(OC2)PD7" pad="21"/>
<connect gate="G$1" pin="(RXD)PD0" pad="14"/>
<connect gate="G$1" pin="(SCK)PB7" pad="8"/>
<connect gate="G$1" pin="(SCL)PC0" pad="22"/>
<connect gate="G$1" pin="(SDA)PC1" pad="23"/>
<connect gate="G$1" pin="(SS)PB4" pad="5"/>
<connect gate="G$1" pin="(T0/XCK)PB0" pad="1"/>
<connect gate="G$1" pin="(T1)PB1" pad="2"/>
<connect gate="G$1" pin="(TCK)PC2" pad="24"/>
<connect gate="G$1" pin="(TDI)PC5" pad="27"/>
<connect gate="G$1" pin="(TDO)PC4" pad="26"/>
<connect gate="G$1" pin="(TMS)PC3" pad="25"/>
<connect gate="G$1" pin="(TOSC1)PC6" pad="28"/>
<connect gate="G$1" pin="(TOSC2)PC7" pad="29"/>
<connect gate="G$1" pin="(TXD)PD1" pad="15"/>
<connect gate="G$1" pin="AREF" pad="32"/>
<connect gate="G$1" pin="AVCC" pad="30"/>
<connect gate="G$1" pin="GND" pad="11"/>
<connect gate="G$1" pin="GND@1" pad="31"/>
<connect gate="G$1" pin="RESET" pad="9"/>
<connect gate="G$1" pin="VCC" pad="10"/>
<connect gate="G$1" pin="XTAL1" pad="13"/>
<connect gate="G$1" pin="XTAL2" pad="12"/>
</connects>
<package3dinstances>
<package3dinstance package3d_urn="urn:adsk.eagle:package:4314/1"/>
</package3dinstances>
<technologies>
<technology name="">
<attribute name="MF" value="" constant="no"/>
<attribute name="MPN" value="ATMEGA32-16PU" constant="no"/>
<attribute name="OC_FARNELL" value="1661729" constant="no"/>
<attribute name="OC_NEWARK" value="51P1794" constant="no"/>
<attribute name="POPULARITY" value="1" constant="no"/>
</technology>
</technologies>
</device>
</devices>
</deviceset>
</devicesets>
</library>
</libraries>
<attributes>
</attributes>
<variantdefs>
</variantdefs>
<classes>
<class number="0" name="default" width="0" drill="0">
</class>
</classes>
<groups>
<schematic_group name="220_V_SUPPLY"/>
<schematic_group name="OPEN-CLOSE"/>
<schematic_group name="RGBLED"/>
<schematic_group name="ESP"/>
<schematic_group name="SUPPLY_GENERATOR"/>
<schematic_group name="OUTDOOR_SUPPLY"/>
<schematic_group name="BME_280_TEMP_HUM1"/>
<schematic_group name="GY-SGP30"/>
<schematic_group name="ATMEGA32"/>
<schematic_group name="OUTDOOR_NOICE_LEVEL_SENSOR"/>
<schematic_group name="433MHZ_TRANSMITTER"/>
<schematic_group name="SERVO"/>
<schematic_group name="HALL_SENSOR"/>
</groups>
<parts>
<part name="ACDC1" library="my_devices" deviceset="ACDC" device=""/>
<part name="SUPPLY1" library="supply2" library_urn="urn:adsk.eagle:library:372" deviceset="VCC" device=""/>
<part name="SUPPLY2" library="supply2" library_urn="urn:adsk.eagle:library:372" deviceset="VCC" device=""/>
<part name="GND1" library="supply1" library_urn="urn:adsk.eagle:library:371" deviceset="GND" device=""/>
<part name="U1" library="my_devices" deviceset="ESP32" device=""/>
<part name="GND2" library="supply1" library_urn="urn:adsk.eagle:library:371" deviceset="GND" device=""/>
<part name="R7" library="my_devices" deviceset="R" device="" value="620"/>
<part name="R6" library="my_devices" deviceset="R" device="" value="620"/>
<part name="SW1" library="my_devices" deviceset="SWITCH" device=""/>
<part name="Q4" library="my_devices" deviceset="TRANSISTOR_NPN" device="" value="2N3904"/>
<part name="R9" library="my_devices" deviceset="R" device="" value="10K"/>
<part name="GND4" library="supply1" library_urn="urn:adsk.eagle:library:371" deviceset="GND" device=""/>
<part name="R5" library="my_devices" deviceset="R" device="" value="620"/>
<part name="TS1" library="my_devices" deviceset="TOUCH_SENSOR" device=""/>
<part name="TS2" library="my_devices" deviceset="TOUCH_SENSOR" device=""/>
<part name="D1" library="my_devices" deviceset="RGBLED" device=""/>
<part name="R1" library="my_devices" deviceset="R" device="" value="620"/>
<part name="R2" library="my_devices" deviceset="R" device="" value="620"/>
<part name="R3" library="my_devices" deviceset="R" device="" value="620"/>
<part name="Q1" library="my_devices" deviceset="TRANSISTOR_NPN" device="" value="2N3904"/>
<part name="Q2" library="my_devices" deviceset="TRANSISTOR_NPN" device="" value="2N3904"/>
<part name="Q3" library="my_devices" deviceset="TRANSISTOR_NPN" device="" value="2N3904"/>
<part name="GND7" library="supply1" library_urn="urn:adsk.eagle:library:371" deviceset="GND" device=""/>
<part name="D2" library="my_devices" deviceset="DIODE_BRIDGE" device="" value="DB104"/>
<part name="IC1" library="atmel" library_urn="urn:adsk.eagle:library:105" deviceset="MEGA32-P" device="" package3d_urn="urn:adsk.eagle:package:4314/1"/>
<part name="U5" library="my_devices" deviceset="VOLTAGE_REGULATOR" device="" value="KIA7805API-U/PF"/>
<part name="C12" library="my_devices" deviceset="C" device="" value="1000 uF"/>
<part name="C13" library="my_devices" deviceset="C" device="" value="1000 uF"/>
<part name="C6" library="my_devices" deviceset="C" device="" value="0.22 uF"/>
<part name="R14" library="my_devices" deviceset="R" device="" value="10K"/>
<part name="C5" library="my_devices" deviceset="C" device="" value="10 uF"/>
<part name="U3" library="my_devices" deviceset="BME280" device="" value="BMP280 / 5V"/>
<part name="U6" library="my_devices" deviceset="GY-SGP30" device=""/>
<part name="U4" library="my_devices" deviceset="MSGEQ7" device=""/>
<part name="C10" library="my_devices" deviceset="C-1" device="" value="33 pF"/>
<part name="R18" library="my_devices" deviceset="R" device="" value="200k"/>
<part name="C9" library="my_devices" deviceset="C-1" device="" value="0.1 uF"/>
<part name="C8" library="my_devices" deviceset="C-1" device="" value="0.01 uF"/>
<part name="BM1" library="my_devices" deviceset="MICROPHONE" device="" value="EM-9767P"/>
<part name="X1" library="my_devices" deviceset="X" device="" value="HC-49S (16MHZ)"/>
<part name="C2" library="my_devices" deviceset="C-1" device="" value="22 pF"/>
<part name="C3" library="my_devices" deviceset="C-1" device="" value="22 pF"/>
<part name="L2" library="my_devices" deviceset="L-2" device=""/>
<part name="C7" library="my_devices" deviceset="C-1" device="" value="0.47 uF /  20V">
<attribute name="SPICEPREFIX" value="C"/>
</part>
<part name="C11" library="my_devices" deviceset="C-1" device="" value="0.47 uF /  20V"/>
<part name="U7" library="my_devices" deviceset="433MHZ_TRANSMITTER" device=""/>
<part name="L1" library="my_devices" deviceset="L-3" device=""/>
<part name="R10" library="my_devices" deviceset="R" device="" value="10K"/>
<part name="Q7" library="my_devices" deviceset="MOSFET_N" device="" value="STP14NM50N"/>
<part name="J1" library="my_devices" deviceset="SERVO" device="" value="MTR-SERVO-FS5103B"/>
<part name="Q8" library="my_devices" deviceset="MOSFET_N" device="" value="STP14NM50N"/>
<part name="Q9" library="my_devices" deviceset="MOSFET_N" device="" value="STP14NM50N"/>
<part name="GND6" library="supply1" library_urn="urn:adsk.eagle:library:371" deviceset="GND" device=""/>
<part name="GND8" library="supply1" library_urn="urn:adsk.eagle:library:371" deviceset="GND" device=""/>
<part name="U2" library="my_devices" deviceset="CD4047" device=""/>
<part name="C1" library="my_devices" deviceset="C-1" device="" value="100 pF"/>
<part name="R12" library="my_devices" deviceset="R" device="" value="10K"/>
<part name="GND5" library="supply1" library_urn="urn:adsk.eagle:library:371" deviceset="GND" device=""/>
<part name="R15" library="my_devices" deviceset="R" device="" value="620"/>
<part name="R16" library="my_devices" deviceset="R" device="" value="620"/>
<part name="R13" library="my_devices" deviceset="RD" device="" value="2K"/>
<part name="R17" library="my_devices" deviceset="R" device="" value="4 om / 5W"/>
<part name="SW2" library="my_devices" deviceset="SWITCH" device=""/>
<part name="C4" library="my_devices" deviceset="C" device="" value="1000 uF"/>
<part name="GND9" library="supply1" library_urn="urn:adsk.eagle:library:371" deviceset="GND" device=""/>
<part name="B1" library="my_devices" deviceset="HALL_SENSOR" device="" value="A3144"/>
<part name="GND10" library="supply1" library_urn="urn:adsk.eagle:library:371" deviceset="GND" device=""/>
<part name="Q5" library="my_devices" deviceset="TRANSISTOR_NPN" device="" value="2N3904"/>
<part name="R11" library="my_devices" deviceset="R" device="" value="10K"/>
<part name="GND11" library="supply1" library_urn="urn:adsk.eagle:library:371" deviceset="GND" device=""/>
<part name="R8" library="my_devices" deviceset="R" device="" value="10K"/>
<part name="Q6" library="my_devices" deviceset="TRANSISTOR_PNP" device="" value="2N3906BU"/>
<part name="R4" library="my_devices" deviceset="R" device="" value="10K"/>
<part name="GND3" library="supply1" library_urn="urn:adsk.eagle:library:371" deviceset="GND" device=""/>
</parts>
<sheets>
<sheet>
<plain>
<text x="-81.28" y="58.42" size="1.778" layer="91">Indoor window control unit</text>
<text x="260.35" y="122.8725" size="1.778" layer="91">=&gt; WINDOW =&gt;</text>
<text x="369.57" y="-55.245" size="1.778" layer="91" rot="R180" grouprefs="OUTDOOR_NOICE_LEVEL_SENSOR">https://cxem.net/sound/light/light82.php</text>
<text x="436.88" y="-24.13" size="1.778" layer="91" grouprefs="433MHZ_TRANSMITTER">https://habr.com/ru/post/491530/</text>
<text x="226.3775" y="113.665" size="1.778" layer="91" grouprefs="SUPPLY_GENERATOR">10 turns</text>
<text x="223.8375" y="129.2225" size="1.778" layer="91" grouprefs="SUPPLY_GENERATOR">~8..13 turns
1.347 uH</text>
<text x="298.1325" y="129.2225" size="1.778" layer="91" grouprefs="OUTDOOR_SUPPLY">15-20 turns</text>
<text x="296.8625" y="115.2525" size="1.778" layer="91" grouprefs="OUTDOOR_SUPPLY">~8..13 turns
1.347 uH</text>
<text x="226.3775" y="119.0625" size="1.778" layer="91" grouprefs="SUPPLY_GENERATOR">10 turns</text>
<text x="332.74" y="20.32" size="1.778" layer="91" grouprefs="BME_280_TEMP_HUM1">5V Module required!</text>
<text x="78.74" y="124.46" size="1.778" layer="91" grouprefs="SUPPLY_GENERATOR">Freq ~ 200 KHz</text>
<text x="198.12" y="157.48" size="1.778" layer="91" grouprefs="SUPPLY_GENERATOR">calc LC -&gt; https://coil32.ru/calc/jslcc.html</text>
<text x="198.12" y="152.4" size="1.778" layer="91" grouprefs="SUPPLY_GENERATOR">calc L -&gt; https://coil32.ru/calc/ferrite-rod.html</text>
<text x="215.9" y="111.76" size="1.778" layer="91" grouprefs="SUPPLY_GENERATOR">1.1 uH</text>
<text x="215.9" y="119.38" size="1.778" layer="91" grouprefs="SUPPLY_GENERATOR">1.1 uH</text>
</plain>
<instances>
<instance part="ACDC1" gate="G$1" x="-153.67" y="-44.45" smashed="yes">
<attribute name="NAME" x="-158.75" y="-41.91" size="1.778" layer="94"/>
</instance>
<instance part="SUPPLY1" gate="G$1" x="-199.39" y="-29.21" smashed="yes" grouprefs="220_V_SUPPLY">
<attribute name="VALUE" x="-201.295" y="-26.035" size="1.778" layer="96"/>
</instance>
<instance part="SUPPLY2" gate="G$1" x="-209.55" y="-29.21" smashed="yes" grouprefs="220_V_SUPPLY">
<attribute name="VALUE" x="-211.455" y="-26.035" size="1.778" layer="96"/>
</instance>
<instance part="GND1" gate="1" x="-105.41" y="-41.91" smashed="yes">
<attribute name="VALUE" x="-107.95" y="-44.45" size="1.778" layer="96"/>
</instance>
<instance part="U1" gate="G$1" x="-175.26" y="134.62" smashed="yes" grouprefs="ESP">
<attribute name="NAME" x="-180.34" y="162.56" size="1.778" layer="94"/>
<attribute name="VALUE" x="-180.34" y="106.68" size="1.778" layer="94"/>
</instance>
<instance part="GND2" gate="1" x="-111.76" y="152.4" smashed="yes" grouprefs="ESP">
<attribute name="VALUE" x="-114.3" y="149.86" size="1.778" layer="96"/>
</instance>
<instance part="R7" gate="G$1" x="-31.75" y="163.83" smashed="yes" grouprefs="SERVO">
<attribute name="NAME" x="-38.1" y="166.37" size="1.778" layer="94"/>
<attribute name="VALUE" x="-38.1" y="160.02" size="1.778" layer="94"/>
</instance>
<instance part="R6" gate="G$1" x="-48.26" y="95.25" smashed="yes" grouprefs="SERVO">
<attribute name="NAME" x="-54.61" y="97.79" size="1.778" layer="94"/>
<attribute name="VALUE" x="-54.61" y="91.44" size="1.778" layer="94"/>
</instance>
<instance part="SW1" gate="G$1" x="-64.77" y="130.81" smashed="yes" grouprefs="SERVO">
<attribute name="NAME" x="-69.85" y="135.89" size="1.778" layer="94"/>
<attribute name="VALUE" x="-69.85" y="125.73" size="1.778" layer="94"/>
</instance>
<instance part="Q4" gate="G$1" x="-46.99" y="140.97" smashed="yes" rot="R90" grouprefs="SERVO">
<attribute name="NAME" x="-48.26" y="144.78" size="1.778" layer="94" rot="R90"/>
<attribute name="VALUE" x="-44.45" y="144.78" size="1.778" layer="94" rot="R90"/>
</instance>
<instance part="R9" gate="G$1" x="-26.67" y="140.97" smashed="yes" grouprefs="SERVO">
<attribute name="NAME" x="-33.02" y="143.51" size="1.778" layer="94"/>
<attribute name="VALUE" x="-33.02" y="137.16" size="1.778" layer="94"/>
</instance>
<instance part="GND4" gate="1" x="-8.89" y="143.51" smashed="yes" grouprefs="SERVO">
<attribute name="VALUE" x="-11.43" y="140.97" size="1.778" layer="96"/>
</instance>
<instance part="R5" gate="G$1" x="-49.53" y="156.21" smashed="yes" grouprefs="SERVO">
<attribute name="NAME" x="-55.88" y="158.75" size="1.778" layer="94"/>
<attribute name="VALUE" x="-55.88" y="152.4" size="1.778" layer="94"/>
</instance>
<instance part="TS1" gate="G$1" x="12.7" y="66.04" smashed="yes" grouprefs="OPEN-CLOSE">
<attribute name="NAME" x="7.62" y="71.12" size="1.778" layer="94"/>
</instance>
<instance part="TS2" gate="G$1" x="12.7" y="40.64" smashed="yes" grouprefs="OPEN-CLOSE">
<attribute name="NAME" x="7.62" y="45.72" size="1.778" layer="94"/>
</instance>
<instance part="D1" gate="G$1" x="-114.3" y="53.34" smashed="yes" grouprefs="RGBLED">
<attribute name="NAME" x="-114.3" y="63.5" size="1.778" layer="94"/>
</instance>
<instance part="R1" gate="G$1" x="-185.42" y="73.66" smashed="yes" grouprefs="RGBLED">
<attribute name="NAME" x="-191.77" y="76.2" size="1.778" layer="94"/>
<attribute name="VALUE" x="-191.77" y="69.85" size="1.778" layer="94"/>
</instance>
<instance part="R2" gate="G$1" x="-185.42" y="55.88" smashed="yes" grouprefs="RGBLED">
<attribute name="NAME" x="-191.77" y="58.42" size="1.778" layer="94"/>
<attribute name="VALUE" x="-191.77" y="52.07" size="1.778" layer="94"/>
</instance>
<instance part="R3" gate="G$1" x="-185.42" y="38.1" smashed="yes" grouprefs="RGBLED">
<attribute name="NAME" x="-191.77" y="40.64" size="1.778" layer="94"/>
<attribute name="VALUE" x="-191.77" y="34.29" size="1.778" layer="94"/>
</instance>
<instance part="Q1" gate="G$1" x="-160.02" y="73.66" smashed="yes" grouprefs="RGBLED">
<attribute name="NAME" x="-156.21" y="74.93" size="1.778" layer="94"/>
<attribute name="VALUE" x="-156.21" y="71.12" size="1.778" layer="94"/>
</instance>
<instance part="Q2" gate="G$1" x="-160.02" y="55.88" smashed="yes" grouprefs="RGBLED">
<attribute name="NAME" x="-156.21" y="57.15" size="1.778" layer="94"/>
<attribute name="VALUE" x="-156.21" y="53.34" size="1.778" layer="94"/>
</instance>
<instance part="Q3" gate="G$1" x="-160.02" y="38.1" smashed="yes" grouprefs="RGBLED">
<attribute name="NAME" x="-156.21" y="39.37" size="1.778" layer="94"/>
<attribute name="VALUE" x="-156.21" y="35.56" size="1.778" layer="94"/>
</instance>
<instance part="GND7" gate="1" x="-129.54" y="40.64" smashed="yes" grouprefs="RGBLED">
<attribute name="VALUE" x="-132.08" y="38.1" size="1.778" layer="96"/>
</instance>
<instance part="D2" gate="G$1" x="323.5325" y="130.4925" smashed="yes" grouprefs="OUTDOOR_SUPPLY">
<attribute name="NAME" x="319.7225" y="139.3825" size="1.778" layer="94"/>
<attribute name="VALUE" x="319.7225" y="120.3325" size="1.778" layer="94"/>
</instance>
<instance part="IC1" gate="G$1" x="149.86" y="-2.54" smashed="yes" grouprefs="ATMEGA32">
<attribute name="NAME" x="134.62" y="43.942" size="1.778" layer="95"/>
<attribute name="VALUE" x="134.62" y="-50.8" size="1.778" layer="96"/>
</instance>
<instance part="U5" gate="G$1" x="379.4125" y="135.5725" smashed="yes" grouprefs="OUTDOOR_SUPPLY">
<attribute name="NAME" x="376.8725" y="145.7325" size="1.778" layer="94"/>
<attribute name="VALUE" x="376.8725" y="143.1925" size="1.778" layer="94"/>
</instance>
<instance part="C12" gate="G$1" x="354.0125" y="130.4925" smashed="yes" rot="R270" grouprefs="OUTDOOR_SUPPLY">
<attribute name="NAME" x="359.0925" y="135.5725" size="1.778" layer="94" rot="R270"/>
<attribute name="VALUE" x="346.3925" y="135.5725" size="1.778" layer="94" rot="R270"/>
</instance>
<instance part="C13" gate="G$1" x="404.8125" y="130.4925" smashed="yes" rot="R270" grouprefs="OUTDOOR_SUPPLY">
<attribute name="NAME" x="409.8925" y="135.5725" size="1.778" layer="94" rot="R270"/>
<attribute name="VALUE" x="397.1925" y="135.5725" size="1.778" layer="94" rot="R270"/>
</instance>
<instance part="C6" gate="G$1" x="121.92" y="5.08" smashed="yes" rot="R270" grouprefs="ATMEGA32">
<attribute name="NAME" x="127" y="10.16" size="1.778" layer="94" rot="R270"/>
<attribute name="VALUE" x="114.3" y="10.16" size="1.778" layer="94" rot="R270"/>
</instance>
<instance part="R14" gate="G$1" x="124.46" y="53.34" smashed="yes" rot="R90" grouprefs="ATMEGA32">
<attribute name="NAME" x="121.92" y="46.99" size="1.778" layer="94" rot="R90"/>
<attribute name="VALUE" x="128.27" y="46.99" size="1.778" layer="94" rot="R90"/>
</instance>
<instance part="C5" gate="G$1" x="114.3" y="40.64" smashed="yes" rot="R180" grouprefs="ATMEGA32">
<attribute name="NAME" x="119.38" y="35.56" size="1.778" layer="94" rot="R180"/>
<attribute name="VALUE" x="119.38" y="48.26" size="1.778" layer="94" rot="R180"/>
</instance>
<instance part="U3" gate="G$1" x="332.74" y="27.94" smashed="yes" grouprefs="BME_280_TEMP_HUM1">
<attribute name="NAME" x="337.82" y="38.1" size="1.778" layer="94"/>
</instance>
<instance part="U6" gate="G$1" x="441.96" y="35.56" smashed="yes" grouprefs="GY-SGP30">
<attribute name="NAME" x="439.42" y="45.72" size="1.778" layer="94"/>
</instance>
<instance part="U4" gate="G$1" x="342.9" y="-36.195" smashed="yes" rot="R180" grouprefs="OUTDOOR_NOICE_LEVEL_SENSOR">
<attribute name="NAME" x="347.98" y="-48.895" size="1.778" layer="94" rot="R180"/>
<attribute name="VALUE" x="347.98" y="-20.955" size="1.778" layer="94" rot="R180"/>
</instance>
<instance part="C10" gate="G$1" x="312.42" y="-43.815" smashed="yes" rot="R180" grouprefs="OUTDOOR_NOICE_LEVEL_SENSOR">
<attribute name="NAME" x="316.865" y="-46.99" size="1.778" layer="94" rot="R180"/>
<attribute name="VALUE" x="316.865" y="-38.735" size="1.778" layer="94" rot="R180"/>
</instance>
<instance part="R18" gate="G$1" x="312.42" y="-53.975" smashed="yes" rot="R180" grouprefs="OUTDOOR_NOICE_LEVEL_SENSOR">
<attribute name="NAME" x="318.77" y="-56.515" size="1.778" layer="94" rot="R180"/>
<attribute name="VALUE" x="318.77" y="-50.165" size="1.778" layer="94" rot="R180"/>
</instance>
<instance part="C9" gate="G$1" x="312.42" y="-33.655" smashed="yes" rot="R180" grouprefs="OUTDOOR_NOICE_LEVEL_SENSOR">
<attribute name="NAME" x="316.865" y="-36.83" size="1.778" layer="94" rot="R180"/>
<attribute name="VALUE" x="316.865" y="-28.575" size="1.778" layer="94" rot="R180"/>
</instance>
<instance part="C8" gate="G$1" x="312.42" y="-20.955" smashed="yes" rot="R180" grouprefs="OUTDOOR_NOICE_LEVEL_SENSOR">
<attribute name="NAME" x="316.865" y="-24.13" size="1.778" layer="94" rot="R180"/>
<attribute name="VALUE" x="316.865" y="-15.875" size="1.778" layer="94" rot="R180"/>
</instance>
<instance part="BM1" gate="G$1" x="289.56" y="-23.495" smashed="yes" rot="R180" grouprefs="OUTDOOR_NOICE_LEVEL_SENSOR">
<attribute name="NAME" x="281.94" y="-26.035" size="1.778" layer="94" rot="R180"/>
<attribute name="VALUE" x="281.94" y="-20.955" size="1.778" layer="94" rot="R180"/>
</instance>
<instance part="X1" gate="G$1" x="111.76" y="26.67" smashed="yes" rot="R90" grouprefs="ATMEGA32">
<attribute name="NAME" x="109.22" y="21.59" size="1.778" layer="94" rot="R90"/>
<attribute name="VALUE" x="116.205" y="21.59" size="1.778" layer="94" rot="R90"/>
</instance>
<instance part="C2" gate="G$1" x="93.98" y="33.02" smashed="yes" grouprefs="ATMEGA32">
<attribute name="NAME" x="89.535" y="36.195" size="1.778" layer="94"/>
<attribute name="VALUE" x="89.535" y="27.94" size="1.778" layer="94"/>
</instance>
<instance part="C3" gate="G$1" x="93.98" y="20.32" smashed="yes" grouprefs="ATMEGA32">
<attribute name="NAME" x="89.535" y="23.495" size="1.778" layer="94"/>
<attribute name="VALUE" x="89.535" y="15.24" size="1.778" layer="94"/>
</instance>
<instance part="L2" gate="G$1" x="295.5925" y="120.3325" smashed="yes" grouprefs="OUTDOOR_SUPPLY">
<attribute name="NAME" x="282.8925" y="125.4125" size="1.778" layer="94"/>
<attribute name="VALUE" x="282.8925" y="120.3325" size="1.778" layer="94"/>
</instance>
<instance part="C7" gate="G$1" x="216.8525" y="137.16" smashed="yes" rot="R270" grouprefs="SUPPLY_GENERATOR">
<attribute name="NAME" x="220.0275" y="141.605" size="1.778" layer="94" rot="R270"/>
<attribute name="VALUE" x="211.7725" y="141.605" size="1.778" layer="94" rot="R270"/>
</instance>
<instance part="C11" gate="G$1" x="317.1825" y="105.0925" smashed="yes" rot="R90" grouprefs="OUTDOOR_SUPPLY">
<attribute name="NAME" x="314.0075" y="100.6475" size="1.778" layer="94" rot="R90"/>
<attribute name="VALUE" x="322.2625" y="100.6475" size="1.778" layer="94" rot="R90"/>
</instance>
<instance part="U7" gate="G$1" x="473.71" y="-33.02" smashed="yes" grouprefs="433MHZ_TRANSMITTER">
<attribute name="NAME" x="476.25" y="-25.4" size="1.778" layer="94"/>
<attribute name="VALUE" x="476.25" y="-43.18" size="1.778" layer="94"/>
</instance>
<instance part="L1" gate="G$1" x="240.9825" y="127.635" smashed="yes" rot="R180" grouprefs="SUPPLY_GENERATOR">
<attribute name="NAME" x="253.6825" y="122.555" size="1.778" layer="94" rot="R180"/>
<attribute name="VALUE" x="253.6825" y="127.635" size="1.778" layer="94" rot="R180"/>
</instance>
<instance part="R10" gate="G$1" x="-26.67" y="130.81" smashed="yes" grouprefs="SERVO">
<attribute name="NAME" x="-33.02" y="133.35" size="1.778" layer="94"/>
<attribute name="VALUE" x="-33.02" y="127" size="1.778" layer="94"/>
</instance>
<instance part="Q7" gate="G$1" x="-16.51" y="113.03" smashed="yes" rot="R180" grouprefs="SERVO">
<attribute name="NAME" x="0" y="110.49" size="1.778" layer="94" rot="R180"/>
<attribute name="VALUE" x="0" y="118.11" size="1.778" layer="94" rot="R180"/>
</instance>
<instance part="J1" gate="G$1" x="21.59" y="123.19" smashed="yes" grouprefs="SERVO">
<attribute name="VALUE" x="19.05" y="113.03" size="1.778" layer="94"/>
<attribute name="NAME" x="19.05" y="133.35" size="1.778" layer="94"/>
</instance>
<instance part="Q8" gate="G$1" x="182.88" y="137.16" smashed="yes" rot="R180" grouprefs="SUPPLY_GENERATOR">
<attribute name="NAME" x="199.39" y="134.62" size="1.778" layer="94" rot="R180"/>
<attribute name="VALUE" x="199.39" y="142.24" size="1.778" layer="94" rot="R180"/>
</instance>
<instance part="Q9" gate="G$1" x="182.88" y="104.14" smashed="yes" rot="R180" grouprefs="SUPPLY_GENERATOR">
<attribute name="NAME" x="199.39" y="101.6" size="1.778" layer="94" rot="R180"/>
<attribute name="VALUE" x="199.39" y="109.22" size="1.778" layer="94" rot="R180"/>
</instance>
<instance part="GND6" gate="1" x="172.72" y="149.86" smashed="yes" grouprefs="SUPPLY_GENERATOR">
<attribute name="VALUE" x="170.18" y="147.32" size="1.778" layer="96"/>
</instance>
<instance part="GND8" gate="1" x="170.18" y="114.3" smashed="yes" grouprefs="SUPPLY_GENERATOR">
<attribute name="VALUE" x="167.64" y="111.76" size="1.778" layer="96"/>
</instance>
<instance part="U2" gate="G$1" x="132.08" y="134.62" smashed="yes" grouprefs="SUPPLY_GENERATOR">
<attribute name="NAME" x="128.27" y="145.415" size="1.778" layer="94"/>
<attribute name="VALUE" x="127.635" y="121.92" size="1.778" layer="94"/>
</instance>
<instance part="C1" gate="G$1" x="83.82" y="144.78" smashed="yes" rot="R90" grouprefs="SUPPLY_GENERATOR">
<attribute name="NAME" x="80.645" y="140.335" size="1.778" layer="94" rot="R90"/>
<attribute name="VALUE" x="88.9" y="140.335" size="1.778" layer="94" rot="R90"/>
</instance>
<instance part="R12" gate="G$1" x="93.98" y="144.78" smashed="yes" rot="R90" grouprefs="SUPPLY_GENERATOR">
<attribute name="NAME" x="91.44" y="138.43" size="1.778" layer="94" rot="R90"/>
<attribute name="VALUE" x="97.79" y="138.43" size="1.778" layer="94" rot="R90"/>
</instance>
<instance part="GND5" gate="1" x="132.08" y="114.3" smashed="yes" grouprefs="SUPPLY_GENERATOR">
<attribute name="VALUE" x="129.54" y="111.76" size="1.778" layer="96"/>
</instance>
<instance part="R15" gate="G$1" x="162.56" y="139.7" smashed="yes" grouprefs="SUPPLY_GENERATOR">
<attribute name="NAME" x="156.21" y="142.24" size="1.778" layer="94"/>
<attribute name="VALUE" x="156.21" y="135.89" size="1.778" layer="94"/>
</instance>
<instance part="R16" gate="G$1" x="162.56" y="106.68" smashed="yes" grouprefs="SUPPLY_GENERATOR">
<attribute name="NAME" x="156.21" y="109.22" size="1.778" layer="94"/>
<attribute name="VALUE" x="156.21" y="102.87" size="1.778" layer="94"/>
</instance>
<instance part="R13" gate="G$1" x="111.76" y="147.32" smashed="yes" rot="R90" grouprefs="SUPPLY_GENERATOR">
<attribute name="NAME" x="115.57" y="142.875" size="1.778" layer="94" rot="R90"/>
<attribute name="VALUE" x="118.11" y="142.24" size="1.778" layer="94" rot="R90"/>
</instance>
<instance part="R17" gate="G$1" x="208.28" y="117.475" smashed="yes" grouprefs="SUPPLY_GENERATOR">
<attribute name="NAME" x="201.93" y="120.015" size="1.778" layer="94"/>
<attribute name="VALUE" x="201.93" y="113.665" size="1.778" layer="94"/>
</instance>
<instance part="SW2" gate="G$1" x="83.82" y="111.76" smashed="yes" grouprefs="SUPPLY_GENERATOR">
<attribute name="NAME" x="78.74" y="116.84" size="1.778" layer="94"/>
<attribute name="VALUE" x="78.74" y="106.68" size="1.778" layer="94"/>
</instance>
<instance part="C4" gate="G$1" x="99.06" y="101.6" smashed="yes" rot="R270" grouprefs="SUPPLY_GENERATOR">
<attribute name="NAME" x="104.14" y="106.68" size="1.778" layer="94" rot="R270"/>
<attribute name="VALUE" x="91.44" y="106.68" size="1.778" layer="94" rot="R270"/>
</instance>
<instance part="GND9" gate="1" x="99.06" y="91.44" smashed="yes" grouprefs="SUPPLY_GENERATOR">
<attribute name="VALUE" x="96.52" y="88.9" size="1.778" layer="96"/>
</instance>
<instance part="B1" gate="G$1" x="-7.62" y="-12.7" smashed="yes" grouprefs="HALL_SENSOR">
<attribute name="NAME" x="0" y="-12.7" size="1.778" layer="94"/>
<attribute name="VALUE" x="0" y="-15.24" size="1.778" layer="94"/>
</instance>
<instance part="GND10" gate="1" x="-7.62" y="-33.02" smashed="yes" grouprefs="HALL_SENSOR">
<attribute name="VALUE" x="-10.16" y="-35.56" size="1.778" layer="96"/>
</instance>
<instance part="Q5" gate="G$1" x="-35.56" y="-12.7" smashed="yes" rot="R180" grouprefs="HALL_SENSOR">
<attribute name="NAME" x="-39.37" y="-13.97" size="1.778" layer="94" rot="R180"/>
<attribute name="VALUE" x="-39.37" y="-10.16" size="1.778" layer="94" rot="R180"/>
</instance>
<instance part="R11" gate="G$1" x="-22.86" y="-2.54" smashed="yes" rot="R90" grouprefs="HALL_SENSOR">
<attribute name="NAME" x="-25.4" y="-8.89" size="1.778" layer="94" rot="R90"/>
<attribute name="VALUE" x="-19.05" y="-8.89" size="1.778" layer="94" rot="R90"/>
</instance>
<instance part="GND11" gate="1" x="-45.72" y="0" smashed="yes" grouprefs="HALL_SENSOR">
<attribute name="VALUE" x="-48.26" y="-2.54" size="1.778" layer="96"/>
</instance>
<instance part="R8" gate="G$1" x="-27.94" y="-24.13" smashed="yes" grouprefs="HALL_SENSOR">
<attribute name="NAME" x="-34.29" y="-21.59" size="1.778" layer="94"/>
<attribute name="VALUE" x="-34.29" y="-27.94" size="1.778" layer="94"/>
</instance>
<instance part="Q6" gate="G$1" x="-31.75" y="107.95" smashed="yes" grouprefs="SERVO">
<attribute name="NAME" x="-27.94" y="109.22" size="1.778" layer="94"/>
<attribute name="VALUE" x="-27.94" y="105.41" size="1.778" layer="94"/>
</instance>
<instance part="R4" gate="G$1" x="-50.8" y="115.57" smashed="yes" grouprefs="SERVO">
<attribute name="NAME" x="-57.15" y="118.11" size="1.778" layer="94"/>
<attribute name="VALUE" x="-57.15" y="111.76" size="1.778" layer="94"/>
</instance>
<instance part="GND3" gate="1" x="-62.23" y="111.76" smashed="yes" grouprefs="SERVO">
<attribute name="VALUE" x="-64.77" y="109.22" size="1.778" layer="96"/>
</instance>
</instances>
<busses>
</busses>
<nets>
<net name="VCC" class="0">
<segment>
<pinref part="SUPPLY1" gate="G$1" pin="VCC"/>
<pinref part="ACDC1" gate="G$1" pin="220V_L"/>
<wire x1="-199.39" y1="-31.75" x2="-199.39" y2="-39.37" width="0.1524" layer="91"/>
<wire x1="-199.39" y1="-39.37" x2="-179.07" y2="-39.37" width="0.1524" layer="91"/>
</segment>
<segment>
<pinref part="SUPPLY2" gate="G$1" pin="VCC"/>
<pinref part="ACDC1" gate="G$1" pin="220V_N"/>
<wire x1="-209.55" y1="-31.75" x2="-209.55" y2="-49.53" width="0.1524" layer="91"/>
<wire x1="-209.55" y1="-49.53" x2="-179.07" y2="-49.53" width="0.1524" layer="91"/>
</segment>
<segment>
<pinref part="D2" gate="G$1" pin="VCC"/>
<wire x1="333.6925" y1="135.5725" x2="338.7725" y2="135.5725" width="0.1524" layer="91" grouprefs="OUTDOOR_SUPPLY"/>
<wire x1="338.7725" y1="135.5725" x2="338.7725" y2="138.1125" width="0.1524" layer="91" grouprefs="OUTDOOR_SUPPLY"/>
<pinref part="U5" gate="G$1" pin="IN"/>
<wire x1="338.7725" y1="138.1125" x2="354.0125" y2="138.1125" width="0.1524" layer="91" grouprefs="OUTDOOR_SUPPLY"/>
<pinref part="C12" gate="G$1" pin="PIN_PLUS"/>
<wire x1="354.0125" y1="138.1125" x2="369.2525" y2="138.1125" width="0.1524" layer="91" grouprefs="OUTDOOR_SUPPLY"/>
<junction x="354.0125" y="138.1125" grouprefs="OUTDOOR_SUPPLY"/>
</segment>
</net>
<net name="+5V" class="0">
<segment>
<pinref part="ACDC1" gate="G$1" pin="OUT_5V"/>
<wire x1="-128.27" y1="-49.53" x2="-105.41" y2="-49.53" width="0.1524" layer="91"/>
<label x="-107.95" y="-49.53" size="1.778" layer="95"/>
</segment>
<segment>
<pinref part="U1" gate="G$1" pin="5V"/>
<wire x1="-195.58" y1="111.76" x2="-220.98" y2="111.76" width="0.1524" layer="91" grouprefs="ESP"/>
<label x="-220.98" y="111.76" size="1.778" layer="95" grouprefs="ESP"/>
</segment>
<segment>
<pinref part="SW1" gate="G$1" pin="P$1"/>
<wire x1="-74.93" y1="130.81" x2="-85.09" y2="130.81" width="0.1524" layer="91" grouprefs="SERVO"/>
<label x="-85.09" y="130.81" size="1.778" layer="95" grouprefs="SERVO"/>
</segment>
<segment>
<pinref part="Q3" gate="G$1" pin="C"/>
<wire x1="-160.02" y1="45.72" x2="-144.78" y2="45.72" width="0.1524" layer="91" grouprefs="RGBLED"/>
<wire x1="-144.78" y1="45.72" x2="-144.78" y2="63.5" width="0.1524" layer="91" grouprefs="RGBLED"/>
<pinref part="Q1" gate="G$1" pin="C"/>
<wire x1="-144.78" y1="63.5" x2="-144.78" y2="76.2" width="0.1524" layer="91" grouprefs="RGBLED"/>
<wire x1="-144.78" y1="76.2" x2="-144.78" y2="81.28" width="0.1524" layer="91" grouprefs="RGBLED"/>
<wire x1="-144.78" y1="81.28" x2="-160.02" y2="81.28" width="0.1524" layer="91" grouprefs="RGBLED"/>
<pinref part="Q2" gate="G$1" pin="C"/>
<wire x1="-160.02" y1="63.5" x2="-144.78" y2="63.5" width="0.1524" layer="91" grouprefs="RGBLED"/>
<junction x="-144.78" y="63.5" grouprefs="RGBLED"/>
<wire x1="-144.78" y1="76.2" x2="-124.46" y2="76.2" width="0.1524" layer="91" grouprefs="RGBLED"/>
<junction x="-144.78" y="76.2" grouprefs="RGBLED"/>
<label x="-129.54" y="76.2" size="1.778" layer="95" grouprefs="RGBLED"/>
</segment>
<segment>
<pinref part="SW2" gate="G$1" pin="P$1"/>
<wire x1="58.42" y1="111.76" x2="73.66" y2="111.76" width="0.1524" layer="91" grouprefs="SUPPLY_GENERATOR"/>
<label x="58.42" y="111.76" size="1.778" layer="95" grouprefs="SUPPLY_GENERATOR"/>
</segment>
<segment>
<pinref part="B1" gate="G$1" pin="VCC"/>
<wire x1="-7.62" y1="-5.08" x2="-7.62" y2="6.35" width="0.1524" layer="91" grouprefs="HALL_SENSOR"/>
<label x="-5.08" y="7.62" size="1.778" layer="95" grouprefs="HALL_SENSOR"/>
<pinref part="R11" gate="G$1" pin="P$2"/>
<wire x1="-7.62" y1="7.62" x2="-7.62" y2="10.16" width="0.1524" layer="91" grouprefs="HALL_SENSOR"/>
<wire x1="-22.86" y1="6.35" x2="-7.62" y2="6.35" width="0.1524" layer="91" grouprefs="HALL_SENSOR"/>
<wire x1="-7.62" y1="6.35" x2="-7.62" y2="7.62" width="0.1524" layer="91" grouprefs="HALL_SENSOR"/>
<junction x="-7.62" y="6.35" grouprefs="HALL_SENSOR"/>
</segment>
</net>
<net name="GND" class="0">
<segment>
<pinref part="ACDC1" gate="G$1" pin="OUT_GND"/>
<wire x1="-128.27" y1="-39.37" x2="-105.41" y2="-39.37" width="0.1524" layer="91"/>
<pinref part="GND1" gate="1" pin="GND"/>
</segment>
<segment>
<pinref part="U1" gate="G$1" pin="GND"/>
<wire x1="-154.94" y1="157.48" x2="-111.76" y2="157.48" width="0.1524" layer="91" grouprefs="ESP"/>
<wire x1="-111.76" y1="157.48" x2="-111.76" y2="154.94" width="0.1524" layer="91" grouprefs="ESP"/>
<pinref part="GND2" gate="1" pin="GND"/>
</segment>
<segment>
<pinref part="D1" gate="G$1" pin="GND"/>
<wire x1="-121.92" y1="48.26" x2="-129.54" y2="48.26" width="0.1524" layer="91" grouprefs="RGBLED"/>
<wire x1="-129.54" y1="48.26" x2="-129.54" y2="43.18" width="0.1524" layer="91" grouprefs="RGBLED"/>
<pinref part="GND7" gate="1" pin="GND"/>
</segment>
<segment>
<pinref part="GND4" gate="1" pin="GND"/>
<wire x1="-13.97" y1="146.05" x2="-8.89" y2="146.05" width="0.1524" layer="91" grouprefs="SERVO"/>
<pinref part="R9" gate="G$1" pin="P$2"/>
<wire x1="-13.97" y1="130.81" x2="-13.97" y2="140.97" width="0.1524" layer="91" grouprefs="SERVO"/>
<wire x1="-13.97" y1="140.97" x2="-13.97" y2="146.05" width="0.1524" layer="91" grouprefs="SERVO"/>
<wire x1="-17.78" y1="140.97" x2="-13.97" y2="140.97" width="0.1524" layer="91" grouprefs="SERVO"/>
<junction x="-13.97" y="140.97" grouprefs="SERVO"/>
<pinref part="R10" gate="G$1" pin="P$2"/>
<wire x1="-17.78" y1="130.81" x2="-13.97" y2="130.81" width="0.1524" layer="91" grouprefs="SERVO"/>
<pinref part="Q7" gate="G$1" pin="S"/>
<wire x1="-13.97" y1="120.015" x2="-13.97" y2="130.81" width="0.1524" layer="91" grouprefs="SERVO"/>
<junction x="-13.97" y="130.81" grouprefs="SERVO"/>
</segment>
<segment>
<pinref part="Q8" gate="G$1" pin="S"/>
<wire x1="185.42" y1="144.145" x2="185.42" y2="152.4" width="0.1524" layer="91" grouprefs="SUPPLY_GENERATOR"/>
<wire x1="185.42" y1="152.4" x2="172.72" y2="152.4" width="0.1524" layer="91" grouprefs="SUPPLY_GENERATOR"/>
<pinref part="GND6" gate="1" pin="GND"/>
</segment>
<segment>
<pinref part="Q9" gate="G$1" pin="S"/>
<wire x1="185.42" y1="111.125" x2="185.42" y2="116.84" width="0.1524" layer="91" grouprefs="SUPPLY_GENERATOR"/>
<wire x1="185.42" y1="116.84" x2="170.18" y2="116.84" width="0.1524" layer="91" grouprefs="SUPPLY_GENERATOR"/>
<pinref part="GND8" gate="1" pin="GND"/>
</segment>
<segment>
<pinref part="U2" gate="G$1" pin="GND"/>
<wire x1="121.92" y1="127" x2="121.92" y2="116.84" width="0.1524" layer="91" grouprefs="SUPPLY_GENERATOR"/>
<wire x1="121.92" y1="116.84" x2="132.08" y2="116.84" width="0.1524" layer="91" grouprefs="SUPPLY_GENERATOR"/>
<pinref part="U2" gate="G$1" pin="EXT_RESET"/>
<pinref part="U2" gate="G$1" pin="RE_TRG"/>
<wire x1="132.08" y1="116.84" x2="144.78" y2="116.84" width="0.1524" layer="91" grouprefs="SUPPLY_GENERATOR"/>
<wire x1="142.24" y1="137.16" x2="144.78" y2="137.16" width="0.1524" layer="91" grouprefs="SUPPLY_GENERATOR"/>
<wire x1="144.78" y1="137.16" x2="144.78" y2="129.54" width="0.1524" layer="91" grouprefs="SUPPLY_GENERATOR"/>
<wire x1="144.78" y1="129.54" x2="144.78" y2="127" width="0.1524" layer="91" grouprefs="SUPPLY_GENERATOR"/>
<wire x1="144.78" y1="127" x2="144.78" y2="116.84" width="0.1524" layer="91" grouprefs="SUPPLY_GENERATOR"/>
<wire x1="142.24" y1="129.54" x2="144.78" y2="129.54" width="0.1524" layer="91" grouprefs="SUPPLY_GENERATOR"/>
<junction x="144.78" y="129.54" grouprefs="SUPPLY_GENERATOR"/>
<pinref part="U2" gate="G$1" pin="+TRG"/>
<wire x1="142.24" y1="127" x2="144.78" y2="127" width="0.1524" layer="91" grouprefs="SUPPLY_GENERATOR"/>
<junction x="144.78" y="127" grouprefs="SUPPLY_GENERATOR"/>
<pinref part="GND5" gate="1" pin="GND"/>
<junction x="132.08" y="116.84" grouprefs="SUPPLY_GENERATOR"/>
</segment>
<segment>
<pinref part="GND9" gate="1" pin="GND"/>
<pinref part="C4" gate="G$1" pin="PIN_GND"/>
<wire x1="99.06" y1="93.98" x2="99.06" y2="96.52" width="0.1524" layer="91" grouprefs="SUPPLY_GENERATOR"/>
</segment>
<segment>
<pinref part="B1" gate="G$1" pin="GND"/>
<pinref part="GND10" gate="1" pin="GND"/>
<wire x1="-7.62" y1="-20.32" x2="-7.62" y2="-30.48" width="0.1524" layer="91" grouprefs="HALL_SENSOR"/>
</segment>
<segment>
<pinref part="Q5" gate="G$1" pin="E"/>
<wire x1="-35.56" y1="-5.08" x2="-35.56" y2="3.81" width="0.1524" layer="91" grouprefs="HALL_SENSOR"/>
<wire x1="-35.56" y1="3.81" x2="-45.72" y2="3.81" width="0.1524" layer="91" grouprefs="HALL_SENSOR"/>
<pinref part="GND11" gate="1" pin="GND"/>
<wire x1="-45.72" y1="3.81" x2="-45.72" y2="2.54" width="0.1524" layer="91" grouprefs="HALL_SENSOR"/>
</segment>
<segment>
<pinref part="GND3" gate="1" pin="GND"/>
<pinref part="R4" gate="G$1" pin="P$1"/>
<wire x1="-62.23" y1="114.3" x2="-62.23" y2="115.57" width="0.1524" layer="91" grouprefs="SERVO"/>
<wire x1="-62.23" y1="115.57" x2="-58.42" y2="115.57" width="0.1524" layer="91" grouprefs="SERVO"/>
</segment>
</net>
<net name="N$1" class="0">
<segment>
<pinref part="R7" gate="G$1" pin="P$2"/>
<wire x1="-22.86" y1="163.83" x2="11.43" y2="163.83" width="0.1524" layer="91" grouprefs="SERVO"/>
<pinref part="J1" gate="G$1" pin="PULSE"/>
<wire x1="11.43" y1="163.83" x2="11.43" y2="128.27" width="0.1524" layer="91" grouprefs="SERVO"/>
</segment>
</net>
<net name="GPIO_SERVO_EN" class="0">
<segment>
<pinref part="R6" gate="G$1" pin="P$1"/>
<wire x1="-55.88" y1="95.25" x2="-83.82" y2="95.25" width="0.1524" layer="91" grouprefs="SERVO"/>
<label x="-83.82" y="95.25" size="1.778" layer="95" grouprefs="SERVO"/>
</segment>
<segment>
<pinref part="U1" gate="G$1" pin="IO18"/>
<wire x1="-154.94" y1="137.16" x2="-109.22" y2="137.16" width="0.1524" layer="91" grouprefs="ESP"/>
<label x="-132.08" y="137.16" size="1.778" layer="95" grouprefs="ESP"/>
</segment>
</net>
<net name="GPIO_SERVO_PULSE" class="0">
<segment>
<pinref part="R7" gate="G$1" pin="P$1"/>
<label x="-85.09" y="163.83" size="1.778" layer="95" grouprefs="SERVO"/>
<wire x1="-39.37" y1="163.83" x2="-85.09" y2="163.83" width="0.1524" layer="91" grouprefs="SERVO"/>
</segment>
<segment>
<pinref part="U1" gate="G$1" pin="IO19"/>
<wire x1="-154.94" y1="139.7" x2="-109.22" y2="139.7" width="0.1524" layer="91" grouprefs="ESP"/>
<label x="-132.08" y="139.7" size="1.778" layer="95" grouprefs="ESP"/>
</segment>
</net>
<net name="3V3" class="0">
<segment>
<pinref part="Q4" gate="G$1" pin="C"/>
<wire x1="-54.61" y1="140.97" x2="-85.09" y2="140.97" width="0.1524" layer="91" grouprefs="SERVO"/>
<label x="-85.09" y="140.97" size="1.778" layer="95" grouprefs="SERVO"/>
</segment>
<segment>
<pinref part="U1" gate="G$1" pin="3V3"/>
<wire x1="-195.58" y1="157.48" x2="-215.9" y2="157.48" width="0.1524" layer="91" grouprefs="ESP"/>
<label x="-215.9" y="157.48" size="1.778" layer="95" grouprefs="ESP"/>
</segment>
<segment>
<pinref part="R8" gate="G$1" pin="P$2"/>
<wire x1="-19.05" y1="-24.13" x2="-19.05" y2="-35.56" width="0.1524" layer="91" grouprefs="HALL_SENSOR"/>
<label x="-19.05" y="-35.56" size="1.778" layer="95" grouprefs="HALL_SENSOR"/>
</segment>
</net>
<net name="N$6" class="0">
<segment>
<pinref part="R9" gate="G$1" pin="P$1"/>
<pinref part="Q4" gate="G$1" pin="E"/>
<wire x1="-34.29" y1="140.97" x2="-36.83" y2="140.97" width="0.1524" layer="91" grouprefs="SERVO"/>
<wire x1="-36.83" y1="140.97" x2="-39.37" y2="140.97" width="0.1524" layer="91" grouprefs="SERVO"/>
<wire x1="-36.83" y1="140.97" x2="-36.83" y2="156.21" width="0.1524" layer="91" grouprefs="SERVO"/>
<junction x="-36.83" y="140.97" grouprefs="SERVO"/>
<wire x1="-36.83" y1="156.21" x2="-40.64" y2="156.21" width="0.1524" layer="91" grouprefs="SERVO"/>
<pinref part="R5" gate="G$1" pin="P$2"/>
</segment>
</net>
<net name="GPIO_SERVO_IS_ON" class="0">
<segment>
<pinref part="R5" gate="G$1" pin="P$1"/>
<wire x1="-57.15" y1="156.21" x2="-85.09" y2="156.21" width="0.1524" layer="91" grouprefs="SERVO"/>
<label x="-85.09" y="156.21" size="1.778" layer="95" grouprefs="SERVO"/>
</segment>
<segment>
<pinref part="U1" gate="G$1" pin="IO21"/>
<wire x1="-154.94" y1="144.78" x2="-109.22" y2="144.78" width="0.1524" layer="91" grouprefs="ESP"/>
<label x="-132.08" y="144.78" size="1.778" layer="95" grouprefs="ESP"/>
</segment>
</net>
<net name="GPIO_TS_WINDOW_OPEN" class="0">
<segment>
<pinref part="TS1" gate="G$1" pin="P$1"/>
<wire x1="5.08" y1="66.04" x2="-30.48" y2="66.04" width="0.1524" layer="91" grouprefs="OPEN-CLOSE"/>
<label x="-30.48" y="66.04" size="1.778" layer="95" grouprefs="OPEN-CLOSE"/>
</segment>
<segment>
<pinref part="U1" gate="G$1" pin="IO0"/>
<wire x1="-154.94" y1="124.46" x2="-114.3" y2="124.46" width="0.1524" layer="91" grouprefs="ESP"/>
<label x="-142.24" y="124.46" size="1.778" layer="95" grouprefs="ESP"/>
</segment>
</net>
<net name="GPIO_TS_WINDOW_CLOSE" class="0">
<segment>
<pinref part="TS2" gate="G$1" pin="P$1"/>
<wire x1="5.08" y1="40.64" x2="-30.48" y2="40.64" width="0.1524" layer="91" grouprefs="OPEN-CLOSE"/>
<label x="-30.48" y="40.64" size="1.778" layer="95" grouprefs="OPEN-CLOSE"/>
</segment>
<segment>
<pinref part="U1" gate="G$1" pin="IO2"/>
<wire x1="-154.94" y1="121.92" x2="-114.3" y2="121.92" width="0.1524" layer="91" grouprefs="ESP"/>
<label x="-142.24" y="121.92" size="1.778" layer="95" grouprefs="ESP"/>
</segment>
</net>
<net name="GPIO_RGB_R" class="0">
<segment>
<pinref part="R3" gate="G$1" pin="P$1"/>
<wire x1="-193.04" y1="38.1" x2="-210.82" y2="38.1" width="0.1524" layer="91" grouprefs="RGBLED"/>
<label x="-215.9" y="38.1" size="1.778" layer="95" grouprefs="RGBLED"/>
</segment>
<segment>
<pinref part="U1" gate="G$1" pin="IO25"/>
<wire x1="-195.58" y1="137.16" x2="-223.52" y2="137.16" width="0.1524" layer="91" grouprefs="ESP"/>
<label x="-223.52" y="137.16" size="1.778" layer="95" grouprefs="ESP"/>
</segment>
</net>
<net name="GPIO_RGB_G" class="0">
<segment>
<pinref part="R2" gate="G$1" pin="P$1"/>
<wire x1="-193.04" y1="55.88" x2="-210.82" y2="55.88" width="0.1524" layer="91" grouprefs="RGBLED"/>
<label x="-215.9" y="55.88" size="1.778" layer="95" grouprefs="RGBLED"/>
</segment>
<segment>
<pinref part="U1" gate="G$1" pin="IO26"/>
<wire x1="-195.58" y1="134.62" x2="-223.52" y2="134.62" width="0.1524" layer="91" grouprefs="ESP"/>
<label x="-223.52" y="134.62" size="1.778" layer="95" grouprefs="ESP"/>
</segment>
</net>
<net name="GPIO_RGB_B" class="0">
<segment>
<pinref part="R1" gate="G$1" pin="P$1"/>
<wire x1="-193.04" y1="73.66" x2="-210.82" y2="73.66" width="0.1524" layer="91" grouprefs="RGBLED"/>
<label x="-215.9" y="73.66" size="1.778" layer="95" grouprefs="RGBLED"/>
</segment>
<segment>
<pinref part="U1" gate="G$1" pin="IO27"/>
<wire x1="-195.58" y1="132.08" x2="-223.52" y2="132.08" width="0.1524" layer="91" grouprefs="ESP"/>
<label x="-223.52" y="132.08" size="1.778" layer="95" grouprefs="ESP"/>
</segment>
</net>
<net name="N$21" class="0">
<segment>
<pinref part="R1" gate="G$1" pin="P$2"/>
<wire x1="-167.64" y1="73.66" x2="-176.53" y2="73.66" width="0.1524" layer="91" grouprefs="RGBLED"/>
<pinref part="Q1" gate="G$1" pin="B"/>
</segment>
</net>
<net name="N$22" class="0">
<segment>
<pinref part="R2" gate="G$1" pin="P$2"/>
<wire x1="-167.64" y1="55.88" x2="-176.53" y2="55.88" width="0.1524" layer="91" grouprefs="RGBLED"/>
<pinref part="Q2" gate="G$1" pin="B"/>
</segment>
</net>
<net name="N$23" class="0">
<segment>
<pinref part="R3" gate="G$1" pin="P$2"/>
<wire x1="-167.64" y1="38.1" x2="-176.53" y2="38.1" width="0.1524" layer="91" grouprefs="RGBLED"/>
<pinref part="Q3" gate="G$1" pin="B"/>
</segment>
</net>
<net name="N$5" class="0">
<segment>
<pinref part="Q1" gate="G$1" pin="E"/>
<wire x1="-160.02" y1="66.04" x2="-121.92" y2="66.04" width="0.1524" layer="91" grouprefs="RGBLED"/>
<pinref part="D1" gate="G$1" pin="VIN_B"/>
<wire x1="-121.92" y1="66.04" x2="-121.92" y2="55.88" width="0.1524" layer="91" grouprefs="RGBLED"/>
</segment>
</net>
<net name="N$7" class="0">
<segment>
<pinref part="Q2" gate="G$1" pin="E"/>
<wire x1="-160.02" y1="48.26" x2="-149.86" y2="48.26" width="0.1524" layer="91" grouprefs="RGBLED"/>
<wire x1="-149.86" y1="48.26" x2="-149.86" y2="53.34" width="0.1524" layer="91" grouprefs="RGBLED"/>
<pinref part="D1" gate="G$1" pin="VIN_G"/>
<wire x1="-149.86" y1="53.34" x2="-121.92" y2="53.34" width="0.1524" layer="91" grouprefs="RGBLED"/>
</segment>
</net>
<net name="N$8" class="0">
<segment>
<pinref part="Q3" gate="G$1" pin="E"/>
<wire x1="-160.02" y1="30.48" x2="-139.7" y2="30.48" width="0.1524" layer="91" grouprefs="RGBLED"/>
<wire x1="-139.7" y1="30.48" x2="-139.7" y2="50.8" width="0.1524" layer="91" grouprefs="RGBLED"/>
<pinref part="D1" gate="G$1" pin="VIN_R"/>
<wire x1="-139.7" y1="50.8" x2="-121.92" y2="50.8" width="0.1524" layer="91" grouprefs="RGBLED"/>
</segment>
</net>
<net name="OUTDOOR_+5V" class="0">
<segment>
<pinref part="U5" gate="G$1" pin="OUT"/>
<pinref part="C13" gate="G$1" pin="PIN_PLUS"/>
<wire x1="389.5725" y1="138.1125" x2="404.8125" y2="138.1125" width="0.1524" layer="91" grouprefs="OUTDOOR_SUPPLY"/>
<junction x="404.8125" y="138.1125" grouprefs="OUTDOOR_SUPPLY"/>
<wire x1="404.8125" y1="138.1125" x2="437.8325" y2="138.1125" width="0.1524" layer="91" grouprefs="OUTDOOR_SUPPLY"/>
<label x="422.5925" y="138.1125" size="1.778" layer="95" grouprefs="OUTDOOR_SUPPLY"/>
</segment>
<segment>
<pinref part="IC1" gate="G$1" pin="VCC"/>
<wire x1="129.54" y1="12.7" x2="124.46" y2="12.7" width="0.1524" layer="91" grouprefs="ATMEGA32"/>
<label x="81.28" y="12.7" size="1.778" layer="95" grouprefs="ATMEGA32"/>
<pinref part="C6" gate="G$1" pin="PIN_PLUS"/>
<wire x1="124.46" y1="12.7" x2="121.92" y2="12.7" width="0.1524" layer="91" grouprefs="ATMEGA32"/>
<wire x1="121.92" y1="12.7" x2="81.28" y2="12.7" width="0.1524" layer="91" grouprefs="ATMEGA32"/>
<junction x="121.92" y="12.7" grouprefs="ATMEGA32"/>
<wire x1="124.46" y1="12.7" x2="124.46" y2="20.32" width="0.1524" layer="91" grouprefs="ATMEGA32"/>
<junction x="124.46" y="12.7" grouprefs="ATMEGA32"/>
<pinref part="IC1" gate="G$1" pin="AVCC"/>
<wire x1="124.46" y1="20.32" x2="129.54" y2="20.32" width="0.1524" layer="91" grouprefs="ATMEGA32"/>
</segment>
<segment>
<pinref part="U4" gate="G$1" pin="VCC"/>
<wire x1="353.06" y1="-43.815" x2="373.38" y2="-43.815" width="0.1524" layer="91" grouprefs="OUTDOOR_NOICE_LEVEL_SENSOR"/>
<label x="373.38" y="-43.815" size="1.778" layer="95" rot="R180" grouprefs="OUTDOOR_NOICE_LEVEL_SENSOR"/>
</segment>
<segment>
<pinref part="R18" gate="G$1" pin="P$2"/>
<wire x1="303.53" y1="-53.975" x2="279.4" y2="-53.975" width="0.1524" layer="91" grouprefs="OUTDOOR_NOICE_LEVEL_SENSOR"/>
<label x="297.18" y="-53.975" size="1.778" layer="95" rot="R180" grouprefs="OUTDOOR_NOICE_LEVEL_SENSOR"/>
</segment>
<segment>
<pinref part="R14" gate="G$1" pin="P$2"/>
<wire x1="124.46" y1="62.23" x2="83.82" y2="62.23" width="0.1524" layer="91" grouprefs="ATMEGA32"/>
<label x="83.82" y="63.5" size="1.778" layer="95" grouprefs="ATMEGA32"/>
</segment>
<segment>
<pinref part="U7" gate="G$1" pin="VCC"/>
<wire x1="468.63" y1="-30.48" x2="435.61" y2="-30.48" width="0.1524" layer="91" grouprefs="433MHZ_TRANSMITTER"/>
<label x="434.34" y="-30.48" size="1.778" layer="95" grouprefs="433MHZ_TRANSMITTER"/>
</segment>
<segment>
<wire x1="434.34" y1="38.1" x2="414.02" y2="38.1" width="0.1524" layer="91" grouprefs="GY-SGP30"/>
<label x="414.02" y="38.1" size="1.778" layer="95" grouprefs="GY-SGP30"/>
<pinref part="U6" gate="G$1" pin="VIN"/>
</segment>
<segment>
<wire x1="322.58" y1="33.02" x2="307.34" y2="33.02" width="0.1524" layer="91" grouprefs="BME_280_TEMP_HUM1"/>
<wire x1="307.34" y1="33.02" x2="307.34" y2="43.18" width="0.1524" layer="91" grouprefs="BME_280_TEMP_HUM1"/>
<label x="304.8" y="43.18" size="1.778" layer="95" grouprefs="BME_280_TEMP_HUM1"/>
<pinref part="U3" gate="G$1" pin="VCC"/>
</segment>
</net>
<net name="OUTDOOR_GND" class="0">
<segment>
<pinref part="D2" gate="G$1" pin="GND"/>
<pinref part="C12" gate="G$1" pin="PIN_GND"/>
<wire x1="333.6925" y1="125.4125" x2="354.0125" y2="125.4125" width="0.1524" layer="91" grouprefs="OUTDOOR_SUPPLY"/>
<wire x1="354.0125" y1="125.4125" x2="379.4125" y2="125.4125" width="0.1524" layer="91" grouprefs="OUTDOOR_SUPPLY"/>
<junction x="354.0125" y="125.4125" grouprefs="OUTDOOR_SUPPLY"/>
<pinref part="U5" gate="G$1" pin="GND"/>
<wire x1="379.4125" y1="125.4125" x2="379.4125" y2="127.9525" width="0.1524" layer="91" grouprefs="OUTDOOR_SUPPLY"/>
<pinref part="C13" gate="G$1" pin="PIN_GND"/>
<wire x1="379.4125" y1="125.4125" x2="404.8125" y2="125.4125" width="0.1524" layer="91" grouprefs="OUTDOOR_SUPPLY"/>
<junction x="379.4125" y="125.4125" grouprefs="OUTDOOR_SUPPLY"/>
<junction x="404.8125" y="125.4125" grouprefs="OUTDOOR_SUPPLY"/>
<wire x1="404.8125" y1="125.4125" x2="437.8325" y2="125.4125" width="0.1524" layer="91" grouprefs="OUTDOOR_SUPPLY"/>
<label x="420.0525" y="122.8725" size="1.778" layer="95" grouprefs="OUTDOOR_SUPPLY"/>
</segment>
<segment>
<pinref part="IC1" gate="G$1" pin="GND"/>
<wire x1="129.54" y1="10.16" x2="129.54" y2="7.62" width="0.1524" layer="91" grouprefs="ATMEGA32"/>
<wire x1="129.54" y1="7.62" x2="129.54" y2="0" width="0.1524" layer="91" grouprefs="ATMEGA32"/>
<wire x1="129.54" y1="0" x2="121.92" y2="0" width="0.1524" layer="91" grouprefs="ATMEGA32"/>
<pinref part="IC1" gate="G$1" pin="GND@1"/>
<wire x1="129.54" y1="17.78" x2="127" y2="17.78" width="0.1524" layer="91" grouprefs="ATMEGA32"/>
<wire x1="127" y1="17.78" x2="127" y2="7.62" width="0.1524" layer="91" grouprefs="ATMEGA32"/>
<wire x1="127" y1="7.62" x2="129.54" y2="7.62" width="0.1524" layer="91" grouprefs="ATMEGA32"/>
<junction x="129.54" y="7.62" grouprefs="ATMEGA32"/>
<pinref part="C6" gate="G$1" pin="PIN_GND"/>
<junction x="121.92" y="0" grouprefs="ATMEGA32"/>
<wire x1="121.92" y1="0" x2="104.14" y2="0" width="0.1524" layer="91" grouprefs="ATMEGA32"/>
<pinref part="C5" gate="G$1" pin="PIN_GND"/>
<wire x1="109.22" y1="40.64" x2="104.14" y2="40.64" width="0.1524" layer="91" grouprefs="ATMEGA32"/>
<label x="81.28" y="40.64" size="1.778" layer="95" grouprefs="ATMEGA32"/>
<wire x1="104.14" y1="40.64" x2="86.36" y2="40.64" width="0.1524" layer="91" grouprefs="ATMEGA32"/>
<wire x1="86.36" y1="40.64" x2="81.28" y2="40.64" width="0.1524" layer="91" grouprefs="ATMEGA32"/>
<wire x1="104.14" y1="0" x2="104.14" y2="40.64" width="0.1524" layer="91" grouprefs="ATMEGA32"/>
<junction x="104.14" y="40.64" grouprefs="ATMEGA32"/>
<pinref part="C3" gate="G$1" pin="P$1"/>
<pinref part="C2" gate="G$1" pin="P$1"/>
<wire x1="86.36" y1="20.32" x2="86.36" y2="33.02" width="0.1524" layer="91" grouprefs="ATMEGA32"/>
<wire x1="86.36" y1="33.02" x2="86.36" y2="40.64" width="0.1524" layer="91" grouprefs="ATMEGA32"/>
<junction x="86.36" y="33.02" grouprefs="ATMEGA32"/>
<junction x="86.36" y="40.64" grouprefs="ATMEGA32"/>
</segment>
<segment>
<wire x1="281.94" y1="30.48" x2="322.58" y2="30.48" width="0.1524" layer="91" grouprefs="BME_280_TEMP_HUM1"/>
<pinref part="U3" gate="G$1" pin="GND"/>
<label x="281.94" y="30.48" size="1.778" layer="95" grouprefs="BME_280_TEMP_HUM1"/>
</segment>
<segment>
<wire x1="434.34" y1="35.56" x2="414.02" y2="35.56" width="0.1524" layer="91" grouprefs="GY-SGP30"/>
<pinref part="U6" gate="G$1" pin="GND"/>
<label x="414.02" y="35.56" size="1.778" layer="95" grouprefs="GY-SGP30"/>
</segment>
<segment>
<pinref part="U4" gate="G$1" pin="GND"/>
<wire x1="353.06" y1="-38.735" x2="373.38" y2="-38.735" width="0.1524" layer="91" grouprefs="OUTDOOR_NOICE_LEVEL_SENSOR"/>
<label x="373.38" y="-38.735" size="1.778" layer="95" rot="R180" grouprefs="OUTDOOR_NOICE_LEVEL_SENSOR"/>
</segment>
<segment>
<pinref part="C10" gate="G$1" pin="P$2"/>
<wire x1="304.8" y1="-43.815" x2="279.4" y2="-43.815" width="0.1524" layer="91" grouprefs="OUTDOOR_NOICE_LEVEL_SENSOR"/>
<label x="299.72" y="-43.815" size="1.778" layer="95" rot="R180" grouprefs="OUTDOOR_NOICE_LEVEL_SENSOR"/>
</segment>
<segment>
<pinref part="C9" gate="G$1" pin="P$2"/>
<wire x1="304.8" y1="-33.655" x2="302.26" y2="-33.655" width="0.1524" layer="91" grouprefs="OUTDOOR_NOICE_LEVEL_SENSOR"/>
<label x="299.72" y="-33.655" size="1.778" layer="95" rot="R180" grouprefs="OUTDOOR_NOICE_LEVEL_SENSOR"/>
<pinref part="BM1" gate="G$1" pin="P$1"/>
<wire x1="302.26" y1="-33.655" x2="279.4" y2="-33.655" width="0.1524" layer="91" grouprefs="OUTDOOR_NOICE_LEVEL_SENSOR"/>
<wire x1="299.72" y1="-26.035" x2="302.26" y2="-26.035" width="0.1524" layer="91" grouprefs="OUTDOOR_NOICE_LEVEL_SENSOR"/>
<wire x1="302.26" y1="-26.035" x2="302.26" y2="-33.655" width="0.1524" layer="91" grouprefs="OUTDOOR_NOICE_LEVEL_SENSOR"/>
<junction x="302.26" y="-33.655" grouprefs="OUTDOOR_NOICE_LEVEL_SENSOR"/>
</segment>
<segment>
<pinref part="U7" gate="G$1" pin="DATA"/>
<wire x1="468.63" y1="-33.02" x2="435.61" y2="-33.02" width="0.1524" layer="91" grouprefs="433MHZ_TRANSMITTER"/>
<label x="434.34" y="-33.02" size="1.778" layer="95" grouprefs="433MHZ_TRANSMITTER"/>
</segment>
</net>
<net name="N$16" class="0">
<segment>
<pinref part="IC1" gate="G$1" pin="RESET"/>
<wire x1="121.92" y1="40.64" x2="124.46" y2="40.64" width="0.1524" layer="91" grouprefs="ATMEGA32"/>
<pinref part="C5" gate="G$1" pin="PIN_PLUS"/>
<pinref part="R14" gate="G$1" pin="P$1"/>
<wire x1="124.46" y1="40.64" x2="129.54" y2="40.64" width="0.1524" layer="91" grouprefs="ATMEGA32"/>
<wire x1="124.46" y1="40.64" x2="124.46" y2="45.72" width="0.1524" layer="91" grouprefs="ATMEGA32"/>
<junction x="124.46" y="40.64" grouprefs="ATMEGA32"/>
</segment>
</net>
<net name="I2C_SDA" class="0">
<segment>
<pinref part="IC1" gate="G$1" pin="(SDA)PC1"/>
<wire x1="170.18" y1="-20.32" x2="187.96" y2="-20.32" width="0.1524" layer="91" grouprefs="ATMEGA32"/>
<label x="177.8" y="-20.32" size="1.778" layer="95" grouprefs="ATMEGA32"/>
</segment>
<segment>
<wire x1="309.88" y1="7.62" x2="309.88" y2="25.4" width="0.1524" layer="91" grouprefs="BME_280_TEMP_HUM1"/>
<wire x1="309.88" y1="25.4" x2="322.58" y2="25.4" width="0.1524" layer="91" grouprefs="BME_280_TEMP_HUM1"/>
<label x="309.88" y="7.62" size="1.778" layer="95" grouprefs="BME_280_TEMP_HUM1"/>
<pinref part="U3" gate="G$1" pin="SDA"/>
</segment>
<segment>
<wire x1="434.34" y1="30.48" x2="424.18" y2="30.48" width="0.1524" layer="91" grouprefs="GY-SGP30"/>
<wire x1="424.18" y1="30.48" x2="424.18" y2="17.78" width="0.1524" layer="91" grouprefs="GY-SGP30"/>
<wire x1="424.18" y1="17.78" x2="408.94" y2="17.78" width="0.1524" layer="91" grouprefs="GY-SGP30"/>
<label x="408.94" y="17.78" size="1.778" layer="95" grouprefs="GY-SGP30"/>
<pinref part="U6" gate="G$1" pin="SDA"/>
</segment>
</net>
<net name="I2C_SCL" class="0">
<segment>
<pinref part="IC1" gate="G$1" pin="(SCL)PC0"/>
<wire x1="187.96" y1="-22.86" x2="170.18" y2="-22.86" width="0.1524" layer="91" grouprefs="ATMEGA32"/>
<label x="177.8" y="-22.86" size="1.778" layer="95" grouprefs="ATMEGA32"/>
</segment>
<segment>
<wire x1="297.18" y1="10.16" x2="297.18" y2="27.94" width="0.1524" layer="91" grouprefs="BME_280_TEMP_HUM1"/>
<wire x1="297.18" y1="27.94" x2="322.58" y2="27.94" width="0.1524" layer="91" grouprefs="BME_280_TEMP_HUM1"/>
<label x="287.02" y="10.16" size="1.778" layer="95" grouprefs="BME_280_TEMP_HUM1"/>
<pinref part="U3" gate="G$1" pin="SCL"/>
</segment>
<segment>
<wire x1="434.34" y1="33.02" x2="419.1" y2="33.02" width="0.1524" layer="91" grouprefs="GY-SGP30"/>
<wire x1="419.1" y1="33.02" x2="419.1" y2="25.4" width="0.1524" layer="91" grouprefs="GY-SGP30"/>
<wire x1="419.1" y1="25.4" x2="408.94" y2="25.4" width="0.1524" layer="91" grouprefs="GY-SGP30"/>
<label x="408.94" y="22.86" size="1.778" layer="95" grouprefs="GY-SGP30"/>
<pinref part="U6" gate="G$1" pin="SCL"/>
</segment>
</net>
<net name="N$17" class="0">
<segment>
<pinref part="U4" gate="G$1" pin="CKIN"/>
<wire x1="332.74" y1="-43.815" x2="325.12" y2="-43.815" width="0.1524" layer="91" grouprefs="OUTDOOR_NOICE_LEVEL_SENSOR"/>
<wire x1="325.12" y1="-43.815" x2="320.04" y2="-43.815" width="0.1524" layer="91" grouprefs="OUTDOOR_NOICE_LEVEL_SENSOR"/>
<junction x="325.12" y="-43.815" grouprefs="OUTDOOR_NOICE_LEVEL_SENSOR"/>
<pinref part="C10" gate="G$1" pin="P$1"/>
<wire x1="325.12" y1="-43.815" x2="325.12" y2="-53.975" width="0.1524" layer="91" grouprefs="OUTDOOR_NOICE_LEVEL_SENSOR"/>
<wire x1="325.12" y1="-53.975" x2="320.04" y2="-53.975" width="0.1524" layer="91" grouprefs="OUTDOOR_NOICE_LEVEL_SENSOR"/>
<pinref part="R18" gate="G$1" pin="P$1"/>
</segment>
</net>
<net name="N$18" class="0">
<segment>
<pinref part="U4" gate="G$1" pin="IGND"/>
<wire x1="332.74" y1="-33.655" x2="320.04" y2="-33.655" width="0.1524" layer="91" grouprefs="OUTDOOR_NOICE_LEVEL_SENSOR"/>
<pinref part="C9" gate="G$1" pin="P$1"/>
</segment>
</net>
<net name="N$19" class="0">
<segment>
<pinref part="U4" gate="G$1" pin="IN"/>
<wire x1="332.74" y1="-28.575" x2="332.74" y2="-20.955" width="0.1524" layer="91" grouprefs="OUTDOOR_NOICE_LEVEL_SENSOR"/>
<wire x1="332.74" y1="-20.955" x2="320.04" y2="-20.955" width="0.1524" layer="91" grouprefs="OUTDOOR_NOICE_LEVEL_SENSOR"/>
<pinref part="C8" gate="G$1" pin="P$1"/>
</segment>
</net>
<net name="N$20" class="0">
<segment>
<pinref part="C8" gate="G$1" pin="P$2"/>
<pinref part="BM1" gate="G$1" pin="P$2"/>
<wire x1="304.8" y1="-20.955" x2="299.72" y2="-20.955" width="0.1524" layer="91" grouprefs="OUTDOOR_NOICE_LEVEL_SENSOR"/>
</segment>
</net>
<net name="NOISE_STROBE" class="0">
<segment>
<pinref part="IC1" gate="G$1" pin="(SS)PB4"/>
<wire x1="170.18" y1="10.16" x2="198.12" y2="10.16" width="0.1524" layer="91" grouprefs="ATMEGA32"/>
<label x="182.88" y="10.16" size="1.778" layer="95" grouprefs="ATMEGA32"/>
</segment>
<segment>
<pinref part="U4" gate="G$1" pin="STROBE"/>
<wire x1="353.06" y1="-28.575" x2="353.06" y2="-21.59" width="0.1524" layer="91"/>
<wire x1="353.06" y1="-21.59" x2="372.745" y2="-21.59" width="0.1524" layer="91"/>
<label x="354.965" y="-24.13" size="1.778" layer="95"/>
</segment>
</net>
<net name="NOISE_RESET" class="0">
<segment>
<pinref part="IC1" gate="G$1" pin="(MOSI)PB5"/>
<wire x1="170.18" y1="12.7" x2="198.12" y2="12.7" width="0.1524" layer="91" grouprefs="ATMEGA32"/>
<label x="182.88" y="12.7" size="1.778" layer="95" grouprefs="ATMEGA32"/>
</segment>
<segment>
<pinref part="U4" gate="G$1" pin="RESET"/>
<wire x1="332.74" y1="-38.735" x2="330.2" y2="-38.735" width="0.1524" layer="91" grouprefs="OUTDOOR_NOICE_LEVEL_SENSOR"/>
<wire x1="330.2" y1="-38.735" x2="330.2" y2="-17.78" width="0.1524" layer="91" grouprefs="OUTDOOR_NOICE_LEVEL_SENSOR"/>
<wire x1="330.2" y1="-17.78" x2="373.38" y2="-17.78" width="0.1524" layer="91" grouprefs="OUTDOOR_NOICE_LEVEL_SENSOR"/>
<label x="372.745" y="-18.415" size="1.778" layer="95" rot="R180" grouprefs="OUTDOOR_NOICE_LEVEL_SENSOR"/>
</segment>
</net>
<net name="NOISE_LEVEL" class="0">
<segment>
<pinref part="IC1" gate="G$1" pin="(ADC1)PA1"/>
<wire x1="170.18" y1="25.4" x2="198.12" y2="25.4" width="0.1524" layer="91" grouprefs="ATMEGA32"/>
<label x="182.88" y="25.4" size="1.778" layer="95" grouprefs="ATMEGA32"/>
</segment>
<segment>
<pinref part="U4" gate="G$1" pin="OUT"/>
<wire x1="353.06" y1="-33.655" x2="354.965" y2="-33.655" width="0.1524" layer="91"/>
<wire x1="354.965" y1="-33.655" x2="354.965" y2="-25.4" width="0.1524" layer="91"/>
<wire x1="354.965" y1="-25.4" x2="373.38" y2="-25.4" width="0.1524" layer="91"/>
<label x="356.87" y="-27.94" size="1.778" layer="95"/>
</segment>
</net>
<net name="N$24" class="0">
<segment>
<pinref part="IC1" gate="G$1" pin="XTAL2"/>
<wire x1="129.54" y1="33.02" x2="111.76" y2="33.02" width="0.1524" layer="91" grouprefs="ATMEGA32"/>
<pinref part="X1" gate="G$1" pin="P$2"/>
<pinref part="C2" gate="G$1" pin="P$2"/>
<wire x1="101.6" y1="33.02" x2="111.76" y2="33.02" width="0.1524" layer="91" grouprefs="ATMEGA32"/>
<junction x="111.76" y="33.02" grouprefs="ATMEGA32"/>
</segment>
</net>
<net name="N$26" class="0">
<segment>
<pinref part="IC1" gate="G$1" pin="XTAL1"/>
<wire x1="129.54" y1="27.94" x2="121.92" y2="27.94" width="0.1524" layer="91" grouprefs="ATMEGA32"/>
<pinref part="X1" gate="G$1" pin="P$1"/>
<wire x1="111.76" y1="20.32" x2="121.92" y2="20.32" width="0.1524" layer="91" grouprefs="ATMEGA32"/>
<wire x1="121.92" y1="20.32" x2="121.92" y2="27.94" width="0.1524" layer="91" grouprefs="ATMEGA32"/>
<pinref part="C3" gate="G$1" pin="P$2"/>
<wire x1="101.6" y1="20.32" x2="111.76" y2="20.32" width="0.1524" layer="91" grouprefs="ATMEGA32"/>
<junction x="111.76" y="20.32" grouprefs="ATMEGA32"/>
</segment>
</net>
<net name="N$14" class="0">
<segment>
<pinref part="D2" gate="G$1" pin="AC1"/>
<pinref part="L2" gate="G$1" pin="L1-1"/>
<wire x1="313.3725" y1="135.5725" x2="300.6725" y2="135.5725" width="0.1524" layer="91" grouprefs="OUTDOOR_SUPPLY"/>
</segment>
</net>
<net name="N$15" class="0">
<segment>
<pinref part="D2" gate="G$1" pin="AC2"/>
<pinref part="L2" gate="G$1" pin="L1-2"/>
<wire x1="313.3725" y1="125.4125" x2="300.6725" y2="125.4125" width="0.1524" layer="91" grouprefs="OUTDOOR_SUPPLY"/>
</segment>
</net>
<net name="N$29" class="0">
<segment>
<pinref part="L2" gate="G$1" pin="L2-2"/>
<wire x1="300.6725" y1="112.7125" x2="304.4825" y2="112.7125" width="0.1524" layer="91" grouprefs="OUTDOOR_SUPPLY"/>
<wire x1="304.4825" y1="112.7125" x2="304.4825" y2="97.4725" width="0.1524" layer="91" grouprefs="OUTDOOR_SUPPLY"/>
<pinref part="C11" gate="G$1" pin="P$1"/>
<wire x1="304.4825" y1="97.4725" x2="317.1825" y2="97.4725" width="0.1524" layer="91" grouprefs="OUTDOOR_SUPPLY"/>
</segment>
</net>
<net name="TRANSMITTER" class="0">
<segment>
<pinref part="U7" gate="G$1" pin="GND"/>
<wire x1="468.63" y1="-35.56" x2="435.61" y2="-35.56" width="0.1524" layer="91" grouprefs="433MHZ_TRANSMITTER"/>
<label x="434.34" y="-35.56" size="1.778" layer="95" grouprefs="433MHZ_TRANSMITTER"/>
</segment>
<segment>
<pinref part="IC1" gate="G$1" pin="(MISO)PB6"/>
<wire x1="170.18" y1="15.24" x2="198.12" y2="15.24" width="0.1524" layer="91" grouprefs="ATMEGA32"/>
<label x="182.88" y="15.24" size="1.778" layer="95" grouprefs="ATMEGA32"/>
</segment>
</net>
<net name="N$32" class="0">
<segment>
<pinref part="SW1" gate="G$1" pin="P$2"/>
<pinref part="Q4" gate="G$1" pin="B"/>
<wire x1="-46.99" y1="130.81" x2="-46.99" y2="133.35" width="0.1524" layer="91" grouprefs="SERVO"/>
<wire x1="-46.99" y1="130.81" x2="-54.61" y2="130.81" width="0.1524" layer="91" grouprefs="SERVO"/>
<junction x="-46.99" y="130.81" grouprefs="SERVO"/>
<pinref part="R10" gate="G$1" pin="P$1"/>
<wire x1="-46.99" y1="130.81" x2="-34.29" y2="130.81" width="0.1524" layer="91" grouprefs="SERVO"/>
<wire x1="-46.99" y1="130.81" x2="-46.99" y2="123.19" width="0.1524" layer="91" grouprefs="SERVO"/>
<pinref part="J1" gate="G$1" pin="VCC"/>
<wire x1="-46.99" y1="123.19" x2="11.43" y2="123.19" width="0.1524" layer="91" grouprefs="SERVO"/>
</segment>
</net>
<net name="N$2" class="0">
<segment>
<pinref part="Q7" gate="G$1" pin="D"/>
<pinref part="J1" gate="G$1" pin="GND"/>
<wire x1="-13.97" y1="106.045" x2="11.43" y2="106.045" width="0.1524" layer="91" grouprefs="SERVO"/>
<wire x1="11.43" y1="106.045" x2="11.43" y2="118.11" width="0.1524" layer="91" grouprefs="SERVO"/>
</segment>
</net>
<net name="N$13" class="0">
<segment>
<pinref part="Q8" gate="G$1" pin="D"/>
<pinref part="L1" gate="G$1" pin="L1-3"/>
<wire x1="185.42" y1="130.175" x2="185.42" y2="122.555" width="0.1524" layer="91" grouprefs="SUPPLY_GENERATOR"/>
<wire x1="185.42" y1="122.555" x2="235.9025" y2="122.555" width="0.1524" layer="91" grouprefs="SUPPLY_GENERATOR"/>
</segment>
</net>
<net name="N$4" class="0">
<segment>
<pinref part="Q9" gate="G$1" pin="D"/>
<pinref part="L1" gate="G$1" pin="L1-1"/>
<wire x1="185.42" y1="97.155" x2="235.9025" y2="97.155" width="0.1524" layer="91" grouprefs="SUPPLY_GENERATOR"/>
<wire x1="235.9025" y1="97.155" x2="235.9025" y2="112.395" width="0.1524" layer="91" grouprefs="SUPPLY_GENERATOR"/>
</segment>
</net>
<net name="N$9" class="0">
<segment>
<pinref part="U2" gate="G$1" pin="RC"/>
<pinref part="R12" gate="G$1" pin="P$1"/>
<wire x1="121.92" y1="137.16" x2="93.98" y2="137.16" width="0.1524" layer="91" grouprefs="SUPPLY_GENERATOR"/>
<pinref part="C1" gate="G$1" pin="P$1"/>
<wire x1="93.98" y1="137.16" x2="83.82" y2="137.16" width="0.1524" layer="91" grouprefs="SUPPLY_GENERATOR"/>
<junction x="93.98" y="137.16" grouprefs="SUPPLY_GENERATOR"/>
</segment>
</net>
<net name="N$11" class="0">
<segment>
<pinref part="U2" gate="G$1" pin="C"/>
<wire x1="121.92" y1="142.24" x2="121.92" y2="162.56" width="0.1524" layer="91" grouprefs="SUPPLY_GENERATOR"/>
<wire x1="121.92" y1="162.56" x2="83.82" y2="162.56" width="0.1524" layer="91" grouprefs="SUPPLY_GENERATOR"/>
<pinref part="C1" gate="G$1" pin="P$2"/>
<wire x1="83.82" y1="152.4" x2="83.82" y2="162.56" width="0.1524" layer="91" grouprefs="SUPPLY_GENERATOR"/>
</segment>
</net>
<net name="N$12" class="0">
<segment>
<pinref part="R15" gate="G$1" pin="P$2"/>
<pinref part="Q8" gate="G$1" pin="G"/>
<wire x1="171.45" y1="139.7" x2="176.53" y2="139.7" width="0.1524" layer="91" grouprefs="SUPPLY_GENERATOR"/>
</segment>
</net>
<net name="N$30" class="0">
<segment>
<pinref part="R16" gate="G$1" pin="P$2"/>
<pinref part="Q9" gate="G$1" pin="G"/>
<wire x1="171.45" y1="106.68" x2="176.53" y2="106.68" width="0.1524" layer="91" grouprefs="SUPPLY_GENERATOR"/>
</segment>
</net>
<net name="N$31" class="0">
<segment>
<pinref part="U2" gate="G$1" pin="Q"/>
<wire x1="142.24" y1="132.08" x2="154.94" y2="132.08" width="0.1524" layer="91" grouprefs="SUPPLY_GENERATOR"/>
<pinref part="R16" gate="G$1" pin="P$1"/>
<wire x1="154.94" y1="132.08" x2="154.94" y2="106.68" width="0.1524" layer="91" grouprefs="SUPPLY_GENERATOR"/>
</segment>
</net>
<net name="N$33" class="0">
<segment>
<pinref part="U2" gate="G$1" pin="Q_"/>
<pinref part="R15" gate="G$1" pin="P$1"/>
<wire x1="142.24" y1="134.62" x2="154.94" y2="134.62" width="0.1524" layer="91" grouprefs="SUPPLY_GENERATOR"/>
<wire x1="154.94" y1="134.62" x2="154.94" y2="139.7" width="0.1524" layer="91" grouprefs="SUPPLY_GENERATOR"/>
</segment>
</net>
<net name="N$10" class="0">
<segment>
<pinref part="R12" gate="G$1" pin="P$2"/>
<wire x1="93.98" y1="153.67" x2="93.98" y2="154.94" width="0.1524" layer="91" grouprefs="SUPPLY_GENERATOR"/>
<pinref part="R13" gate="G$1" pin="P2"/>
<wire x1="93.98" y1="154.94" x2="104.14" y2="154.94" width="0.1524" layer="91" grouprefs="SUPPLY_GENERATOR"/>
<pinref part="R13" gate="G$1" pin="P3"/>
<wire x1="104.14" y1="154.94" x2="111.76" y2="154.94" width="0.1524" layer="91" grouprefs="SUPPLY_GENERATOR"/>
<wire x1="104.14" y1="147.32" x2="104.14" y2="154.94" width="0.1524" layer="91" grouprefs="SUPPLY_GENERATOR"/>
<junction x="104.14" y="154.94" grouprefs="SUPPLY_GENERATOR"/>
</segment>
</net>
<net name="N$34" class="0">
<segment>
<pinref part="R13" gate="G$1" pin="P1"/>
<pinref part="U2" gate="G$1" pin="R"/>
<wire x1="111.76" y1="139.7" x2="121.92" y2="139.7" width="0.1524" layer="91" grouprefs="SUPPLY_GENERATOR"/>
</segment>
</net>
<net name="N$28" class="0">
<segment>
<pinref part="L2" gate="G$1" pin="L2-1"/>
<pinref part="C11" gate="G$1" pin="P$2"/>
<wire x1="300.6725" y1="122.8725" x2="317.1825" y2="122.8725" width="0.1524" layer="91" grouprefs="OUTDOOR_SUPPLY"/>
<wire x1="317.1825" y1="122.8725" x2="317.1825" y2="112.7125" width="0.1524" layer="91" grouprefs="OUTDOOR_SUPPLY"/>
</segment>
</net>
<net name="N$35" class="0">
<segment>
<pinref part="L1" gate="G$1" pin="L1-2"/>
<pinref part="R17" gate="G$1" pin="P$2"/>
<wire x1="235.9025" y1="117.475" x2="217.17" y2="117.475" width="0.1524" layer="91" grouprefs="SUPPLY_GENERATOR"/>
</segment>
</net>
<net name="N$25" class="0">
<segment>
<pinref part="C7" gate="G$1" pin="P$2"/>
<pinref part="L1" gate="G$1" pin="L2-1"/>
<wire x1="216.8525" y1="129.54" x2="216.8525" y2="125.095" width="0.1524" layer="91" grouprefs="SUPPLY_GENERATOR"/>
<wire x1="216.8525" y1="125.095" x2="235.9025" y2="125.095" width="0.1524" layer="91" grouprefs="SUPPLY_GENERATOR"/>
</segment>
</net>
<net name="N$27" class="0">
<segment>
<pinref part="C7" gate="G$1" pin="P$1"/>
<pinref part="L1" gate="G$1" pin="L2-2"/>
<wire x1="216.8525" y1="144.78" x2="235.9025" y2="144.78" width="0.1524" layer="91" grouprefs="SUPPLY_GENERATOR"/>
<wire x1="235.9025" y1="144.78" x2="235.9025" y2="135.255" width="0.1524" layer="91" grouprefs="SUPPLY_GENERATOR"/>
</segment>
</net>
<net name="+5V_GEN" class="0">
<segment>
<label x="71.12" y="166.37" size="1.778" layer="95" grouprefs="SUPPLY_GENERATOR"/>
<pinref part="U2" gate="G$1" pin="AST_"/>
<wire x1="142.24" y1="165.1" x2="78.74" y2="165.1" width="0.1524" layer="91" grouprefs="SUPPLY_GENERATOR"/>
<wire x1="78.74" y1="165.1" x2="69.85" y2="165.1" width="0.1524" layer="91" grouprefs="SUPPLY_GENERATOR"/>
<wire x1="121.92" y1="134.62" x2="78.74" y2="134.62" width="0.1524" layer="91" grouprefs="SUPPLY_GENERATOR"/>
<wire x1="78.74" y1="134.62" x2="78.74" y2="165.1" width="0.1524" layer="91" grouprefs="SUPPLY_GENERATOR"/>
<junction x="78.74" y="165.1" grouprefs="SUPPLY_GENERATOR"/>
<pinref part="U2" gate="G$1" pin="AST"/>
<wire x1="121.92" y1="134.62" x2="121.92" y2="132.08" width="0.1524" layer="91" grouprefs="SUPPLY_GENERATOR"/>
<junction x="121.92" y="134.62" grouprefs="SUPPLY_GENERATOR"/>
<pinref part="U2" gate="G$1" pin="-TRG"/>
<wire x1="121.92" y1="132.08" x2="121.92" y2="129.54" width="0.1524" layer="91" grouprefs="SUPPLY_GENERATOR"/>
<junction x="121.92" y="132.08" grouprefs="SUPPLY_GENERATOR"/>
<pinref part="U2" gate="G$1" pin="VCC"/>
<wire x1="142.24" y1="142.24" x2="142.24" y2="165.1" width="0.1524" layer="91" grouprefs="SUPPLY_GENERATOR"/>
</segment>
<segment>
<pinref part="R17" gate="G$1" pin="P$1"/>
<wire x1="200.66" y1="117.475" x2="190.5" y2="117.475" width="0.1524" layer="91" grouprefs="SUPPLY_GENERATOR"/>
<label x="187.96" y="114.935" size="1.778" layer="95" grouprefs="SUPPLY_GENERATOR"/>
</segment>
<segment>
<pinref part="SW2" gate="G$1" pin="P$2"/>
<wire x1="93.98" y1="111.76" x2="99.06" y2="111.76" width="0.1524" layer="91" grouprefs="SUPPLY_GENERATOR"/>
<label x="104.14" y="111.76" size="1.778" layer="95" grouprefs="SUPPLY_GENERATOR"/>
<pinref part="C4" gate="G$1" pin="PIN_PLUS"/>
<wire x1="99.06" y1="109.22" x2="99.06" y2="111.76" width="0.1524" layer="91" grouprefs="SUPPLY_GENERATOR"/>
<wire x1="99.06" y1="111.76" x2="114.3" y2="111.76" width="0.1524" layer="91" grouprefs="SUPPLY_GENERATOR"/>
<junction x="99.06" y="111.76" grouprefs="SUPPLY_GENERATOR"/>
</segment>
</net>
<net name="N$36" class="0">
<segment>
<wire x1="52.705" y1="-86.995" x2="51.435" y2="-86.995" width="0.1524" layer="91"/>
<wire x1="51.435" y1="-86.995" x2="51.435" y2="74.295" width="0.1524" layer="91" style="longdash"/>
<wire x1="51.435" y1="74.295" x2="268.605" y2="74.295" width="0.1524" layer="91" style="longdash"/>
<wire x1="268.605" y1="74.295" x2="268.605" y2="170.815" width="0.1524" layer="91" style="longdash"/>
<wire x1="268.605" y1="170.815" x2="269.875" y2="170.815" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$37" class="0">
<segment>
<pinref part="Q5" gate="G$1" pin="B"/>
<pinref part="B1" gate="G$1" pin="OUT"/>
<wire x1="-27.94" y1="-12.7" x2="-22.86" y2="-12.7" width="0.1524" layer="91" grouprefs="HALL_SENSOR"/>
<pinref part="R11" gate="G$1" pin="P$1"/>
<wire x1="-22.86" y1="-12.7" x2="-15.24" y2="-12.7" width="0.1524" layer="91" grouprefs="HALL_SENSOR"/>
<wire x1="-22.86" y1="-10.16" x2="-22.86" y2="-12.7" width="0.1524" layer="91" grouprefs="HALL_SENSOR"/>
<junction x="-22.86" y="-12.7" grouprefs="HALL_SENSOR"/>
</segment>
</net>
<net name="HALL_OUT" class="0">
<segment>
<pinref part="Q5" gate="G$1" pin="C"/>
<wire x1="-35.56" y1="-20.32" x2="-35.56" y2="-24.13" width="0.1524" layer="91" grouprefs="HALL_SENSOR"/>
<pinref part="R8" gate="G$1" pin="P$1"/>
<wire x1="-35.56" y1="-24.13" x2="-35.56" y2="-30.48" width="0.1524" layer="91" grouprefs="HALL_SENSOR"/>
<junction x="-35.56" y="-24.13" grouprefs="HALL_SENSOR"/>
<wire x1="-35.56" y1="-30.48" x2="-53.34" y2="-30.48" width="0.1524" layer="91" grouprefs="HALL_SENSOR"/>
<label x="-54.61" y="-30.48" size="1.778" layer="95" grouprefs="HALL_SENSOR"/>
</segment>
<segment>
<pinref part="U1" gate="G$1" pin="IO4"/>
<wire x1="-154.94" y1="127" x2="-114.3" y2="127" width="0.1524" layer="91"/>
<label x="-127" y="128.27" size="1.778" layer="95"/>
</segment>
<segment>
<pinref part="Q6" gate="G$1" pin="B"/>
<wire x1="-39.37" y1="107.95" x2="-85.09" y2="107.95" width="0.1524" layer="91" grouprefs="SERVO"/>
<label x="-83.82" y="109.22" size="1.778" layer="95" grouprefs="SERVO"/>
</segment>
</net>
<net name="N$3" class="0">
<segment>
<pinref part="R6" gate="G$1" pin="P$2"/>
<wire x1="-39.37" y1="95.25" x2="-31.75" y2="95.25" width="0.1524" layer="91" grouprefs="SERVO"/>
<pinref part="Q6" gate="G$1" pin="E"/>
<wire x1="-31.75" y1="95.25" x2="-31.75" y2="100.33" width="0.1524" layer="91" grouprefs="SERVO"/>
</segment>
</net>
<net name="N$38" class="0">
<segment>
<pinref part="Q7" gate="G$1" pin="G"/>
<pinref part="Q6" gate="G$1" pin="C"/>
<wire x1="-22.86" y1="115.57" x2="-31.75" y2="115.57" width="0.1524" layer="91" grouprefs="SERVO"/>
<pinref part="R4" gate="G$1" pin="P$2"/>
<wire x1="-41.91" y1="115.57" x2="-31.75" y2="115.57" width="0.1524" layer="91" grouprefs="SERVO"/>
<junction x="-31.75" y="115.57" grouprefs="SERVO"/>
</segment>
</net>
</nets>
</sheet>
</sheets>
<errors>
<approved hash="102,1,-128.27,-39.37,OUT_GND,GND,,,,"/>
<approved hash="102,1,-195.58,111.76,5V,+5V,,,,"/>
<approved hash="102,1,333.692,125.413,GND,OUTDOOR_GND,,,,"/>
<approved hash="102,1,389.572,138.113,OUT,OUTDOOR_+5V,,,,"/>
<approved hash="102,1,322.58,30.48,GND,OUTDOOR_GND,,,,"/>
<approved hash="102,1,322.58,33.02,VCC,OUTDOOR_+5V,,,,"/>
<approved hash="102,1,434.34,35.56,GND,OUTDOOR_GND,,,,"/>
<approved hash="102,1,-7.62,-5.08,VCC,+5V,,,,"/>
<approved hash="201,1,434.34,35.56,GND,GND\, OUTDOOR_GND,,,,"/>
<approved hash="201,1,322.58,30.48,GND,GND\, OUTDOOR_GND,,,,"/>
<approved hash="201,1,333.692,125.413,GND,GND\, OUTDOOR_GND,,,,"/>
<approved hash="201,1,-7.62,-5.08,VCC,VCC\, OUTDOOR_+5V\, +5V,,,,"/>
<approved hash="201,1,322.58,33.02,VCC,VCC\, OUTDOOR_+5V\, +5V,,,,"/>
<approved hash="104,1,-179.07,-39.37,ACDC1,220V_L,VCC,,,"/>
<approved hash="104,1,-179.07,-49.53,ACDC1,220V_N,VCC,,,"/>
<approved hash="104,1,-128.27,-49.53,ACDC1,OUT_5V,+5V,,,"/>
<approved hash="104,1,313.373,135.573,D1,AC1,N$14,,,"/>
<approved hash="104,1,313.373,125.413,D1,AC2,N$15,,,"/>
<approved hash="104,1,129.54,17.78,IC1,GND,OUTDOOR_GND,,,"/>
<approved hash="104,1,129.54,20.32,IC1,AVCC,OUTDOOR_+5V,,,"/>
<approved hash="104,1,129.54,12.7,IC1,VCC,OUTDOOR_+5V,,,"/>
<approved hash="104,1,129.54,10.16,IC1,GND,OUTDOOR_GND,,,"/>
<approved hash="104,1,369.252,138.113,U2,IN,VCC,,,"/>
<approved hash="104,1,379.413,127.953,U2,GND,OUTDOOR_GND,,,"/>
<approved hash="104,1,434.34,38.1,U4,VIN,OUTDOOR_+5V,,,"/>
<approved hash="104,1,353.06,-43.815,U6,VCC,OUTDOOR_+5V,,,"/>
<approved hash="104,1,353.06,-38.735,U6,GND,OUTDOOR_GND,,,"/>
<approved hash="104,1,468.63,-30.48,U7,VCC,OUTDOOR_+5V,,,"/>
<approved hash="104,1,468.63,-35.56,U7,GND,TRANSMITTER,,,"/>
<approved hash="104,1,11.43,123.19,J1,VCC,N$32,,,"/>
<approved hash="104,1,11.43,118.11,J1,GND,N$2,,,"/>
<approved hash="104,1,142.24,142.24,U3,VCC,+5V_GEN,,,"/>
<approved hash="105,1,52.07,-86.995,N$36,,,,,"/>
</errors>
</schematic>
</drawing>
<compatibility>
<note version="6.3" minversion="6.2.2" severity="warning">
Since Version 6.2.2 text objects can contain more than one line,
which will not be processed correctly with this version.
</note>
<note version="8.2" severity="warning">
Since Version 8.2, EAGLE supports online libraries. The ids
of those online libraries will not be understood (or retained)
with this version.
</note>
<note version="8.3" severity="warning">
Since Version 8.3, EAGLE supports URNs for individual library
assets (packages, symbols, and devices). The URNs of those assets
will not be understood (or retained) with this version.
</note>
<note version="8.3" severity="warning">
Since Version 8.3, EAGLE supports the association of 3D packages
with devices in libraries, schematics, and board files. Those 3D
packages will not be understood (or retained) with this version.
</note>
<note version="9.5" severity="warning">
Since Version 9.5, EAGLE supports persistent groups with
schematics, and board files. Those persistent groups
will not be understood (or retained) with this version.
</note>
</compatibility>
</eagle>
