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
<library name="my_devices">
<packages>
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
<package name="J2">
<pad name="PIN_1" x="0" y="2.54" drill="1.4" shape="square"/>
<pad name="PIN_2" x="0.04" y="-2.5" drill="1.4" shape="square" rot="R90"/>
<wire x1="3.5" y1="5" x2="3.5" y2="-5" width="0.127" layer="21"/>
<wire x1="-4" y1="5" x2="2.5" y2="5" width="0.127" layer="21"/>
<wire x1="2.5" y1="5" x2="3.5" y2="5" width="0.127" layer="21"/>
<wire x1="2.5" y1="-5" x2="3.5" y2="-5" width="0.127" layer="21"/>
<wire x1="2.5" y1="5" x2="2.5" y2="-5" width="0.127" layer="21"/>
<wire x1="-4" y1="5" x2="-4" y2="4" width="0.127" layer="21"/>
<wire x1="-4" y1="4" x2="-4" y2="1" width="0.127" layer="21"/>
<wire x1="-4" y1="1" x2="-4" y2="-1" width="0.127" layer="21"/>
<wire x1="-4" y1="-1" x2="-4" y2="-4" width="0.127" layer="21"/>
<wire x1="-4" y1="-4" x2="-4" y2="-5" width="0.127" layer="21"/>
<wire x1="-4" y1="-5" x2="2.5" y2="-5" width="0.127" layer="21"/>
<wire x1="-4" y1="4" x2="-1.5" y2="4" width="0.127" layer="21"/>
<wire x1="-4" y1="1" x2="-1.5" y2="1" width="0.127" layer="21"/>
<wire x1="-4" y1="-1" x2="-1.5" y2="-1" width="0.127" layer="21"/>
<wire x1="-4" y1="-4" x2="-1.5" y2="-4" width="0.127" layer="21"/>
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
<package name="MH_Z19B">
<pad name="GND" x="0" y="0" drill="1" shape="square"/>
<pad name="RX" x="0" y="2.54" drill="1" shape="square"/>
<pad name="TX" x="0" y="5.08" drill="1" shape="square"/>
<pad name="VCC" x="0" y="-2.54" drill="1" shape="square"/>
<wire x1="-2.54" y1="6.35" x2="-2.54" y2="-3.81" width="0.127" layer="21"/>
<wire x1="-2.54" y1="-3.81" x2="2.54" y2="-3.81" width="0.127" layer="21"/>
<wire x1="2.54" y1="-3.81" x2="2.54" y2="6.35" width="0.127" layer="21"/>
<wire x1="2.54" y1="6.35" x2="-2.54" y2="6.35" width="0.127" layer="21"/>
<text x="1.27" y="5.08" size="0.3048" layer="21">TXD</text>
<text x="1.27" y="2.54" size="0.3048" layer="21">RXD</text>
<text x="1.27" y="0" size="0.3048" layer="21">GND</text>
<text x="1.27" y="-2.54" size="0.3048" layer="21">VCC</text>
<text x="-1.27" y="0" size="0.3048" layer="21" rot="R90">MH-Z19B</text>
</package>
<package name="LD">
<pad name="PIN_CATHODE" x="-1.27" y="0" drill="0.8" shape="square"/>
<pad name="PIN_ANODE" x="1.27" y="0" drill="0.8" shape="square"/>
<circle x="0" y="0" radius="3.81" width="0.127" layer="21"/>
<wire x1="-0.635" y1="-1.27" x2="-0.635" y2="-1.905" width="0.127" layer="21"/>
<wire x1="-0.635" y1="-1.905" x2="-0.635" y2="-2.54" width="0.127" layer="21"/>
<wire x1="-0.635" y1="-1.27" x2="0.635" y2="-1.905" width="0.127" layer="21"/>
<wire x1="-0.635" y1="-2.54" x2="0.635" y2="-1.905" width="0.127" layer="21"/>
<wire x1="0.635" y1="-1.905" x2="0.635" y2="-1.27" width="0.127" layer="21"/>
<wire x1="0.635" y1="-1.905" x2="0.635" y2="-2.54" width="0.127" layer="21"/>
<wire x1="0.635" y1="-1.905" x2="1.27" y2="-1.905" width="0.127" layer="21"/>
<wire x1="-1.27" y1="-1.905" x2="-0.635" y2="-1.905" width="0.127" layer="21"/>
</package>
<package name="TOUCH_SENSOR">
<pad name="P$1" x="0" y="0" drill="1" shape="square"/>
<circle x="0" y="0" radius="1.27" width="0.127" layer="21"/>
</package>
<package name="BH1750">
<pad name="SCL" x="0" y="1.27" drill="0.8" shape="square"/>
<pad name="GND" x="0" y="-1.27" drill="0.8" shape="square"/>
<pad name="SDA" x="0" y="3.81" drill="0.8" shape="square"/>
<pad name="VCC" x="0" y="-3.81" drill="0.8" shape="square"/>
<wire x1="-1.27" y1="7.62" x2="-1.27" y2="-5.08" width="0.127" layer="21"/>
<wire x1="7.62" y1="-5.08" x2="-1.27" y2="-5.08" width="0.127" layer="21"/>
<text x="1.27" y="3.81" size="0.8128" layer="21">SDA</text>
<text x="1.27" y="1.27" size="0.8128" layer="21">SCL</text>
<text x="1.27" y="-1.27" size="0.8128" layer="21">GND</text>
<text x="1.27" y="-3.81" size="0.8128" layer="21">VCC</text>
<wire x1="7.62" y1="7.62" x2="7.62" y2="-5.08" width="0.127" layer="21"/>
<text x="6.35" y="-1.27" size="0.8128" layer="21" rot="R90">BH1750</text>
<wire x1="-1.27" y1="7.62" x2="7.62" y2="7.62" width="0.127" layer="21"/>
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
<package name="C">
<pad name="PIN_PLUS" x="-2.54" y="0" drill="0.8" shape="square"/>
<pad name="PIN_GND" x="2.54" y="0" drill="0.8" shape="square"/>
<circle x="0" y="0" radius="5.08" width="0.127" layer="21"/>
<wire x1="-3.175" y1="-1.905" x2="-1.905" y2="-1.905" width="0.127" layer="21"/>
<wire x1="-2.54" y1="-1.27" x2="-2.54" y2="-2.54" width="0.127" layer="21"/>
<wire x1="1.905" y1="-1.905" x2="3.175" y2="-1.905" width="0.127" layer="21"/>
</package>
<package name="PMS7003_J">
<pad name="VCC" x="-1.27" y="1.27" drill="1" shape="square"/>
<pad name="GND" x="-1.27" y="-1.27" drill="1" shape="square"/>
<pad name="SET" x="-1.27" y="-3.81" drill="1" shape="square"/>
<pad name="RESET" x="1.27" y="-3.81" drill="1" shape="square"/>
<pad name="RXD" x="1.27" y="-1.27" drill="1" shape="square"/>
<pad name="TXD" x="1.27" y="1.27" drill="1" shape="square"/>
<text x="-0.635" y="0" size="0.3048" layer="21">PMS7003</text>
<text x="-1.905" y="0" size="0.3048" layer="21">VCC</text>
<text x="-1.905" y="-2.54" size="0.3048" layer="21">GND</text>
<text x="-0.3175" y="-4.7625" size="0.3048" layer="21">SET</text>
<text x="2.2225" y="-3.81" size="0.3048" layer="21">RESET</text>
<text x="2.2225" y="1.27" size="0.3048" layer="21">TXD</text>
<text x="2.2225" y="-1.27" size="0.3048" layer="21">RXD</text>
<wire x1="-2.54" y1="2.54" x2="-2.54" y2="-5.08" width="0.127" layer="21"/>
<wire x1="-2.54" y1="-5.08" x2="3.81" y2="-5.08" width="0.127" layer="21"/>
<wire x1="3.81" y1="-5.08" x2="3.81" y2="2.54" width="0.127" layer="21"/>
<wire x1="3.81" y1="2.54" x2="-2.54" y2="2.54" width="0.127" layer="21"/>
</package>
</packages>
<symbols>
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
<symbol name="J2">
<pin name="PIN_1" x="7.62" y="0" visible="off" length="middle" rot="R180"/>
<pin name="PIN_2" x="7.62" y="-2.54" visible="off" length="middle" rot="R180"/>
<text x="-2.54" y="1.905" size="1.778" layer="94">&gt;NAME</text>
<text x="-2.54" y="-7.62" size="1.778" layer="94">&gt;VALUE</text>
<circle x="2.54" y="0" radius="0.898025" width="0.254" layer="94"/>
<circle x="2.54" y="-2.54" radius="0.898025" width="0.254" layer="94"/>
<wire x1="0.635" y1="1.27" x2="0.635" y2="-3.81" width="0.254" layer="94"/>
<wire x1="0.635" y1="-3.81" x2="3.81" y2="-3.81" width="0.254" layer="94"/>
<wire x1="3.81" y1="1.27" x2="3.81" y2="-3.81" width="0.254" layer="94"/>
<wire x1="3.81" y1="1.27" x2="0.635" y2="1.27" width="0.254" layer="94"/>
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
<symbol name="MH_Z19B">
<pin name="VCC" x="-5.08" y="5.08" length="middle" direction="pwr"/>
<pin name="GND" x="-5.08" y="2.54" length="middle" direction="pwr"/>
<pin name="RX" x="-5.08" y="0" length="middle"/>
<pin name="TX" x="-5.08" y="-2.54" length="middle"/>
<wire x1="0" y1="7.62" x2="0" y2="-5.08" width="0.254" layer="94"/>
<wire x1="0" y1="-5.08" x2="7.62" y2="-5.08" width="0.254" layer="94"/>
<wire x1="7.62" y1="-5.08" x2="7.62" y2="7.62" width="0.254" layer="94"/>
<wire x1="7.62" y1="7.62" x2="0" y2="7.62" width="0.254" layer="94"/>
<text x="10.16" y="5.08" size="1.778" layer="94">&gt;NAME</text>
<text x="10.16" y="-2.54" size="1.778" layer="94">MH-Z19B</text>
</symbol>
<symbol name="LD">
<pin name="PIN_CATHODE" x="-7.62" y="0" visible="off" length="middle"/>
<wire x1="-2.54" y1="2.54" x2="-2.54" y2="-2.54" width="0.254" layer="94"/>
<wire x1="-2.54" y1="-2.54" x2="0" y2="0" width="0.254" layer="94"/>
<wire x1="-2.54" y1="2.54" x2="0" y2="0" width="0.254" layer="94"/>
<pin name="PIN_ANODE" x="5.08" y="0" visible="off" length="middle" rot="R180"/>
<wire x1="0" y1="2.54" x2="0" y2="-2.54" width="0.254" layer="94"/>
<wire x1="0.508" y1="3.048" x2="1.524" y2="4.064" width="0.254" layer="94"/>
<polygon width="0.254" layer="94">
<vertex x="1.016" y="4.064"/>
<vertex x="1.524" y="3.556"/>
<vertex x="1.524" y="4.064"/>
</polygon>
<wire x1="-1.016" y1="3.556" x2="0" y2="4.572" width="0.254" layer="94"/>
<polygon width="0.254" layer="94">
<vertex x="-0.508" y="4.572"/>
<vertex x="0" y="4.064"/>
<vertex x="0" y="4.572"/>
</polygon>
<text x="-7.62" y="-5.08" size="1.778" layer="94">&gt;NAME</text>
<text x="-7.62" y="-7.62" size="1.778" layer="94">&gt;VALUE</text>
</symbol>
<symbol name="TOUCH_SENSOR">
<pin name="P$1" x="-7.62" y="0" visible="off" length="middle"/>
<wire x1="-2.54" y1="2.54" x2="-2.54" y2="-2.54" width="0.254" layer="94"/>
<wire x1="-2.54" y1="-2.54" x2="2.54" y2="-2.54" width="0.254" layer="94"/>
<wire x1="2.54" y1="-2.54" x2="2.54" y2="2.54" width="0.254" layer="94"/>
<wire x1="2.54" y1="2.54" x2="-2.54" y2="2.54" width="0.254" layer="94"/>
<text x="-5.08" y="5.08" size="1.778" layer="94">&gt;NAME</text>
</symbol>
<symbol name="BH1750">
<pin name="I2C_SDA" x="-7.62" y="5.08" length="middle"/>
<pin name="I2C_SCL" x="-7.62" y="2.54" length="middle"/>
<pin name="GND" x="-7.62" y="0" length="middle" direction="sup"/>
<pin name="VCC" x="-7.62" y="-2.54" length="middle" direction="sup"/>
<wire x1="-2.54" y1="7.62" x2="-2.54" y2="-5.08" width="0.254" layer="94"/>
<wire x1="-2.54" y1="-5.08" x2="22.86" y2="-5.08" width="0.254" layer="94"/>
<wire x1="22.86" y1="-5.08" x2="22.86" y2="7.62" width="0.254" layer="94"/>
<wire x1="22.86" y1="7.62" x2="-2.54" y2="7.62" width="0.254" layer="94"/>
<text x="10.16" y="0" size="1.778" layer="94">BH1750</text>
<text x="5.08" y="10.16" size="1.778" layer="94">&gt;NAME</text>
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
<symbol name="PMS7003_J">
<pin name="TXD" x="-7.62" y="2.54" length="middle"/>
<pin name="RXD" x="-7.62" y="0" length="middle"/>
<pin name="RESET" x="-7.62" y="-2.54" length="middle"/>
<pin name="SET" x="-7.62" y="-5.08" length="middle"/>
<pin name="GND" x="-7.62" y="5.08" length="middle" direction="sup"/>
<pin name="VCC" x="-7.62" y="7.62" length="middle" direction="sup"/>
<wire x1="-2.54" y1="10.16" x2="-2.54" y2="-7.62" width="0.254" layer="94"/>
<wire x1="-2.54" y1="-7.62" x2="22.86" y2="-7.62" width="0.254" layer="94"/>
<wire x1="22.86" y1="-7.62" x2="22.86" y2="10.16" width="0.254" layer="94"/>
<wire x1="22.86" y1="10.16" x2="-2.54" y2="10.16" width="0.254" layer="94"/>
<text x="7.62" y="-2.54" size="1.778" layer="94">PMS7003</text>
<text x="7.62" y="5.08" size="1.778" layer="94">&gt;NAME</text>
</symbol>
</symbols>
<devicesets>
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
<deviceset name="J2" prefix="J">
<gates>
<gate name="G$1" symbol="J2" x="-2.54" y="0"/>
</gates>
<devices>
<device name="" package="J2">
<connects>
<connect gate="G$1" pin="PIN_1" pad="PIN_1"/>
<connect gate="G$1" pin="PIN_2" pad="PIN_2"/>
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
<deviceset name="MH_Z19B" prefix="U">
<gates>
<gate name="G$1" symbol="MH_Z19B" x="-2.54" y="0"/>
</gates>
<devices>
<device name="" package="MH_Z19B">
<connects>
<connect gate="G$1" pin="GND" pad="GND"/>
<connect gate="G$1" pin="RX" pad="RX"/>
<connect gate="G$1" pin="TX" pad="TX"/>
<connect gate="G$1" pin="VCC" pad="VCC"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
<deviceset name="LD" prefix="D">
<gates>
<gate name="G$1" symbol="LD" x="0" y="0"/>
</gates>
<devices>
<device name="" package="LD">
<connects>
<connect gate="G$1" pin="PIN_ANODE" pad="PIN_ANODE"/>
<connect gate="G$1" pin="PIN_CATHODE" pad="PIN_CATHODE"/>
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
<deviceset name="BH1750" prefix="U">
<gates>
<gate name="G$1" symbol="BH1750" x="-10.16" y="0"/>
</gates>
<devices>
<device name="" package="BH1750">
<connects>
<connect gate="G$1" pin="GND" pad="GND"/>
<connect gate="G$1" pin="I2C_SCL" pad="SCL"/>
<connect gate="G$1" pin="I2C_SDA" pad="SDA"/>
<connect gate="G$1" pin="VCC" pad="VCC"/>
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
<deviceset name="PMS7003" prefix="U">
<gates>
<gate name="G$1" symbol="PMS7003_J" x="-10.16" y="-2.54"/>
</gates>
<devices>
<device name="" package="PMS7003_J">
<connects>
<connect gate="G$1" pin="GND" pad="GND"/>
<connect gate="G$1" pin="RESET" pad="RESET"/>
<connect gate="G$1" pin="RXD" pad="RXD"/>
<connect gate="G$1" pin="SET" pad="SET"/>
<connect gate="G$1" pin="TXD" pad="TXD"/>
<connect gate="G$1" pin="VCC" pad="VCC"/>
</connects>
<technologies>
<technology name=""/>
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
<clearance class="0" value="0.205"/>
</class>
</classes>
<groups>
<schematic_group name="ESP1"/>
<schematic_group name="BME_280_TEMP_HUM1"/>
<schematic_group name="MH_Z19B_CO1"/>
<schematic_group name="BH1"/>
<schematic_group name="RGBLED1"/>
<schematic_group name="IR1"/>
<schematic_group name="TOUCH_SENSOR1"/>
<schematic_group name="GY-SGP1"/>
<schematic_group name="5V_SUPPLY_JET1"/>
<schematic_group name="ANEMOMETER1"/>
<schematic_group name="PMS1"/>
</groups>
<parts>
<part name="GND1" library="supply1" library_urn="urn:adsk.eagle:library:371" deviceset="GND" device=""/>
<part name="GND9" library="supply1" library_urn="urn:adsk.eagle:library:371" deviceset="GND" device=""/>
<part name="R7" library="my_devices" deviceset="R" device="" value="5 om, 2W"/>
<part name="J12" library="my_devices" deviceset="J2" device="" value="J4_FS_2"/>
<part name="U2" library="my_devices" deviceset="ESP32" device="" value="ESP32 DEVKIT WROOM-32D"/>
<part name="GND2" library="supply1" library_urn="urn:adsk.eagle:library:371" deviceset="GND" device=""/>
<part name="GND5" library="supply1" library_urn="urn:adsk.eagle:library:371" deviceset="GND" device=""/>
<part name="D2" library="my_devices" deviceset="RGBLED" device=""/>
<part name="U6" library="my_devices" deviceset="MH_Z19B" device=""/>
<part name="GND13" library="supply1" library_urn="urn:adsk.eagle:library:371" deviceset="GND" device=""/>
<part name="R11" library="my_devices" deviceset="R" device="" value="600"/>
<part name="R12" library="my_devices" deviceset="R" device="" value="600"/>
<part name="R13" library="my_devices" deviceset="R" device="" value="600"/>
<part name="D1" library="my_devices" deviceset="LD" device="" value="IR"/>
<part name="GND10" library="supply1" library_urn="urn:adsk.eagle:library:371" deviceset="GND" device=""/>
<part name="Q3" library="my_devices" deviceset="TRANSISTOR_NPN" device="" value="2N3904"/>
<part name="R14" library="my_devices" deviceset="R" device="" value="100"/>
<part name="R10" library="my_devices" deviceset="R" device="" value="600"/>
<part name="TS1" library="my_devices" deviceset="TOUCH_SENSOR" device=""/>
<part name="U4" library="my_devices" deviceset="BH1750" device=""/>
<part name="U5" library="my_devices" deviceset="BME280" device=""/>
<part name="Q4" library="my_devices" deviceset="TRANSISTOR_NPN" device="" value="2N3904"/>
<part name="Q5" library="my_devices" deviceset="TRANSISTOR_NPN" device="" value="2N3904"/>
<part name="Q6" library="my_devices" deviceset="TRANSISTOR_NPN" device="" value="2N3904"/>
<part name="GND7" library="supply1" library_urn="urn:adsk.eagle:library:371" deviceset="GND" device=""/>
<part name="GND6" library="supply1" library_urn="urn:adsk.eagle:library:371" deviceset="GND" device=""/>
<part name="U1" library="my_devices" deviceset="GY-SGP30" device=""/>
<part name="C1" library="my_devices" deviceset="C" device="" value="1000 uF"/>
<part name="GND12" library="supply1" library_urn="urn:adsk.eagle:library:371" deviceset="GND" device=""/>
<part name="J10" library="my_devices" deviceset="J2" device=""/>
<part name="GND11" library="supply1" library_urn="urn:adsk.eagle:library:371" deviceset="GND" device=""/>
<part name="Q2" library="my_devices" deviceset="TRANSISTOR_NPN" device="" value="2N3904"/>
<part name="Q1" library="my_devices" deviceset="TRANSISTOR_NPN" device="" value="2N3904"/>
<part name="R3" library="my_devices" deviceset="R" device="" value="600"/>
<part name="R6" library="my_devices" deviceset="R" device="" value="600"/>
<part name="GND3" library="supply1" library_urn="urn:adsk.eagle:library:371" deviceset="GND" device=""/>
<part name="R2" library="my_devices" deviceset="R" device="" value="600"/>
<part name="R5" library="my_devices" deviceset="R" device="" value="600"/>
<part name="R1" library="my_devices" deviceset="R" device="" value="600"/>
<part name="R4" library="my_devices" deviceset="R" device="" value="600"/>
<part name="J5" library="my_devices" deviceset="J2" device="" value="KF301-5.0"/>
<part name="J6" library="my_devices" deviceset="J2" device="" value="KF301-5.0"/>
<part name="R8" library="my_devices" deviceset="R" device="" value="10K"/>
<part name="R9" library="my_devices" deviceset="R" device="" value="10K"/>
<part name="GND4" library="supply1" library_urn="urn:adsk.eagle:library:371" deviceset="GND" device=""/>
<part name="U3" library="my_devices" deviceset="PMS7003" device=""/>
</parts>
<sheets>
<sheet>
<plain>
<text x="2.54" y="73.66" size="1.778" layer="91" grouprefs="ESP1">https://mikrokontroler.pl/wp-content/uploads/2020/07/esp32-devkit-pinout.png</text>
<text x="185.42" y="-109.22" size="1.778" layer="91">CHECKED</text>
<text x="205.74" y="20.32" size="1.778" layer="91">CHECKED</text>
<text x="177.8" y="-30.48" size="1.778" layer="91" grouprefs="MH_Z19B_CO1">CHECKED</text>
<text x="281.94" y="7.62" size="1.778" layer="91" grouprefs="TOUCH_SENSOR1">CHECKED</text>
<text x="254" y="-134.62" size="1.778" layer="91" grouprefs="IR1">CHECKED</text>
<text x="330.2" y="-68.58" size="1.778" layer="91">CHECKED</text>
<text x="-17.78" y="-119.38" size="1.778" layer="91">Low voltage block</text>
<text x="58.42" y="-127" size="1.778" layer="91">CHECKED</text>
<text x="-149.86" y="38.1" size="1.778" layer="91" grouprefs="ANEMOMETER1">Low voltage block</text>
<text x="-195.58" y="5.08" size="1.778" layer="91" grouprefs="ANEMOMETER1">CHECKED</text>
<text x="58.42" y="-66.04" size="1.778" layer="91" grouprefs="PMS1">CHECKED</text>
</plain>
<instances>
<instance part="GND1" gate="1" x="99.06" y="53.34" smashed="yes" grouprefs="ESP1">
<attribute name="VALUE" x="96.52" y="50.8" size="1.778" layer="96"/>
</instance>
<instance part="GND9" gate="1" x="-10.16" y="33.02" smashed="yes" grouprefs="ESP1">
<attribute name="VALUE" x="-12.7" y="30.48" size="1.778" layer="96"/>
</instance>
<instance part="R7" gate="G$1" x="12.7" y="55.88" smashed="yes">
<attribute name="NAME" x="6.35" y="58.42" size="1.778" layer="94"/>
<attribute name="VALUE" x="6.35" y="52.07" size="1.778" layer="94"/>
</instance>
<instance part="J12" gate="G$1" x="-22.86" y="40.64" smashed="yes" grouprefs="ESP1">
<attribute name="NAME" x="-25.4" y="42.545" size="1.778" layer="94"/>
<attribute name="VALUE" x="-25.4" y="33.02" size="1.778" layer="94"/>
</instance>
<instance part="U2" gate="G$1" x="48.26" y="33.02" smashed="yes" grouprefs="ESP1">
<attribute name="NAME" x="43.18" y="60.96" size="1.778" layer="94"/>
<attribute name="VALUE" x="43.18" y="5.08" size="1.778" layer="94"/>
</instance>
<instance part="GND2" gate="1" x="152.4" y="38.1" smashed="yes" grouprefs="BME_280_TEMP_HUM1">
<attribute name="VALUE" x="149.86" y="35.56" size="1.778" layer="96"/>
</instance>
<instance part="GND5" gate="1" x="160.02" y="-101.6" smashed="yes" grouprefs="BH1">
<attribute name="VALUE" x="157.48" y="-104.14" size="1.778" layer="96"/>
</instance>
<instance part="D2" gate="G$1" x="340.36" y="-45.72" smashed="yes" grouprefs="RGBLED1">
<attribute name="NAME" x="340.36" y="-35.56" size="1.778" layer="94"/>
</instance>
<instance part="U6" gate="G$1" x="190.5" y="-20.32" smashed="yes" grouprefs="MH_Z19B_CO1">
<attribute name="NAME" x="200.66" y="-15.24" size="1.778" layer="94"/>
</instance>
<instance part="GND13" gate="1" x="154.94" y="-20.32" smashed="yes" grouprefs="MH_Z19B_CO1">
<attribute name="VALUE" x="152.4" y="-22.86" size="1.778" layer="96"/>
</instance>
<instance part="R11" gate="G$1" x="269.24" y="-25.4" smashed="yes" grouprefs="RGBLED1">
<attribute name="NAME" x="262.89" y="-22.86" size="1.778" layer="94"/>
<attribute name="VALUE" x="262.89" y="-29.21" size="1.778" layer="94"/>
</instance>
<instance part="R12" gate="G$1" x="269.24" y="-43.18" smashed="yes" grouprefs="RGBLED1">
<attribute name="NAME" x="262.89" y="-40.64" size="1.778" layer="94"/>
<attribute name="VALUE" x="262.89" y="-46.99" size="1.778" layer="94"/>
</instance>
<instance part="R13" gate="G$1" x="269.24" y="-60.96" smashed="yes" grouprefs="RGBLED1">
<attribute name="NAME" x="262.89" y="-58.42" size="1.778" layer="94"/>
<attribute name="VALUE" x="262.89" y="-64.77" size="1.778" layer="94"/>
</instance>
<instance part="D1" gate="G$1" x="284.48" y="-106.68" smashed="yes" rot="R270" grouprefs="IR1">
<attribute name="NAME" x="279.4" y="-99.06" size="1.778" layer="94" rot="R270"/>
<attribute name="VALUE" x="276.86" y="-99.06" size="1.778" layer="94" rot="R270"/>
</instance>
<instance part="GND10" gate="1" x="284.48" y="-134.62" smashed="yes" grouprefs="IR1">
<attribute name="VALUE" x="281.94" y="-137.16" size="1.778" layer="96"/>
</instance>
<instance part="Q3" gate="G$1" x="284.48" y="-121.92" smashed="yes" grouprefs="IR1">
<attribute name="NAME" x="288.29" y="-120.65" size="1.778" layer="94"/>
<attribute name="VALUE" x="288.29" y="-124.46" size="1.778" layer="94"/>
</instance>
<instance part="R14" gate="G$1" x="274.32" y="-93.98" smashed="yes" grouprefs="IR1">
<attribute name="NAME" x="267.97" y="-91.44" size="1.778" layer="94"/>
<attribute name="VALUE" x="267.97" y="-97.79" size="1.778" layer="94"/>
</instance>
<instance part="R10" gate="G$1" x="264.16" y="-121.92" smashed="yes" grouprefs="IR1">
<attribute name="NAME" x="257.81" y="-119.38" size="1.778" layer="94"/>
<attribute name="VALUE" x="257.81" y="-125.73" size="1.778" layer="94"/>
</instance>
<instance part="TS1" gate="G$1" x="302.26" y="17.78" smashed="yes" grouprefs="TOUCH_SENSOR1">
<attribute name="NAME" x="297.18" y="22.86" size="1.778" layer="94"/>
</instance>
<instance part="U4" gate="G$1" x="180.34" y="-93.98" smashed="yes" grouprefs="BH1"/>
<instance part="U5" gate="G$1" x="203.2" y="38.1" smashed="yes" grouprefs="BME_280_TEMP_HUM1">
<attribute name="NAME" x="208.28" y="48.26" size="1.778" layer="94"/>
</instance>
<instance part="Q4" gate="G$1" x="294.64" y="-25.4" smashed="yes" grouprefs="RGBLED1">
<attribute name="NAME" x="298.45" y="-24.13" size="1.778" layer="94"/>
<attribute name="VALUE" x="298.45" y="-27.94" size="1.778" layer="94"/>
</instance>
<instance part="Q5" gate="G$1" x="294.64" y="-43.18" smashed="yes" grouprefs="RGBLED1">
<attribute name="NAME" x="298.45" y="-41.91" size="1.778" layer="94"/>
<attribute name="VALUE" x="298.45" y="-45.72" size="1.778" layer="94"/>
</instance>
<instance part="Q6" gate="G$1" x="294.64" y="-60.96" smashed="yes" grouprefs="RGBLED1">
<attribute name="NAME" x="298.45" y="-59.69" size="1.778" layer="94"/>
<attribute name="VALUE" x="298.45" y="-63.5" size="1.778" layer="94"/>
</instance>
<instance part="GND7" gate="1" x="325.12" y="-58.42" smashed="yes" grouprefs="RGBLED1">
<attribute name="VALUE" x="322.58" y="-60.96" size="1.778" layer="96"/>
</instance>
<instance part="GND6" gate="1" x="27.94" y="-116.84" smashed="yes" grouprefs="GY-SGP1">
<attribute name="VALUE" x="25.4" y="-119.38" size="1.778" layer="96"/>
</instance>
<instance part="U1" gate="G$1" x="55.88" y="-111.76" smashed="yes" grouprefs="GY-SGP1">
<attribute name="NAME" x="53.34" y="-101.6" size="1.778" layer="94"/>
</instance>
<instance part="C1" gate="G$1" x="-15.24" y="-101.6" smashed="yes" rot="R90" grouprefs="5V_SUPPLY_JET1">
<attribute name="NAME" x="-20.32" y="-106.68" size="1.778" layer="94" rot="R90"/>
<attribute name="VALUE" x="-7.62" y="-106.68" size="1.778" layer="94" rot="R90"/>
</instance>
<instance part="GND12" gate="1" x="-2.54" y="-99.06" smashed="yes" grouprefs="5V_SUPPLY_JET1">
<attribute name="VALUE" x="-5.08" y="-101.6" size="1.778" layer="96"/>
</instance>
<instance part="J10" gate="G$1" x="-38.1" y="-101.6" smashed="yes" grouprefs="5V_SUPPLY_JET1">
<attribute name="NAME" x="-40.64" y="-99.695" size="1.778" layer="94"/>
<attribute name="VALUE" x="-40.64" y="-109.22" size="1.778" layer="94"/>
</instance>
<instance part="GND11" gate="1" x="-129.54" y="-33.02" smashed="yes" grouprefs="ANEMOMETER1">
<attribute name="VALUE" x="-132.08" y="-35.56" size="1.778" layer="96"/>
</instance>
<instance part="Q2" gate="G$1" x="-104.14" y="-17.78" smashed="yes" grouprefs="ANEMOMETER1">
<attribute name="NAME" x="-96.52" y="-15.24" size="1.778" layer="94"/>
<attribute name="VALUE" x="-96.52" y="-20.32" size="1.778" layer="94"/>
</instance>
<instance part="Q1" gate="G$1" x="-154.94" y="-17.78" smashed="yes" grouprefs="ANEMOMETER1">
<attribute name="NAME" x="-147.32" y="-15.24" size="1.778" layer="94"/>
<attribute name="VALUE" x="-147.32" y="-20.32" size="1.778" layer="94"/>
</instance>
<instance part="R3" gate="G$1" x="-144.78" y="5.08" smashed="yes" grouprefs="ANEMOMETER1">
<attribute name="NAME" x="-151.13" y="7.62" size="1.778" layer="94"/>
<attribute name="VALUE" x="-151.13" y="1.27" size="1.778" layer="94"/>
</instance>
<instance part="R6" gate="G$1" x="-93.98" y="5.08" smashed="yes" grouprefs="ANEMOMETER1">
<attribute name="NAME" x="-100.33" y="7.62" size="1.778" layer="94"/>
<attribute name="VALUE" x="-100.33" y="1.27" size="1.778" layer="94"/>
</instance>
<instance part="GND3" gate="1" x="-129.54" y="76.2" smashed="yes" grouprefs="ANEMOMETER1">
<attribute name="VALUE" x="-132.08" y="73.66" size="1.778" layer="96"/>
</instance>
<instance part="R2" gate="G$1" x="-154.94" y="20.32" smashed="yes" rot="R90" grouprefs="ANEMOMETER1">
<attribute name="NAME" x="-157.48" y="13.97" size="1.778" layer="94" rot="R90"/>
<attribute name="VALUE" x="-151.13" y="13.97" size="1.778" layer="94" rot="R90"/>
</instance>
<instance part="R5" gate="G$1" x="-104.14" y="20.32" smashed="yes" rot="R90" grouprefs="ANEMOMETER1">
<attribute name="NAME" x="-106.68" y="13.97" size="1.778" layer="94" rot="R90"/>
<attribute name="VALUE" x="-100.33" y="13.97" size="1.778" layer="94" rot="R90"/>
</instance>
<instance part="R1" gate="G$1" x="-154.94" y="50.8" smashed="yes" grouprefs="ANEMOMETER1">
<attribute name="NAME" x="-161.29" y="53.34" size="1.778" layer="94"/>
<attribute name="VALUE" x="-161.29" y="46.99" size="1.778" layer="94"/>
</instance>
<instance part="R4" gate="G$1" x="-111.76" y="50.8" smashed="yes" grouprefs="ANEMOMETER1">
<attribute name="NAME" x="-118.11" y="53.34" size="1.778" layer="94"/>
<attribute name="VALUE" x="-118.11" y="46.99" size="1.778" layer="94"/>
</instance>
<instance part="J5" gate="G$1" x="-193.04" y="78.74" smashed="yes" grouprefs="ANEMOMETER1">
<attribute name="NAME" x="-195.58" y="80.645" size="1.778" layer="94"/>
<attribute name="VALUE" x="-195.58" y="71.12" size="1.778" layer="94"/>
</instance>
<instance part="J6" gate="G$1" x="-193.04" y="66.04" smashed="yes" grouprefs="ANEMOMETER1">
<attribute name="NAME" x="-195.58" y="67.945" size="1.778" layer="94"/>
<attribute name="VALUE" x="-195.58" y="58.42" size="1.778" layer="94"/>
</instance>
<instance part="R8" gate="G$1" x="27.94" y="-60.96" smashed="yes" grouprefs="PMS1">
<attribute name="NAME" x="21.59" y="-58.42" size="1.778" layer="94"/>
<attribute name="VALUE" x="21.59" y="-64.77" size="1.778" layer="94"/>
</instance>
<instance part="R9" gate="G$1" x="27.94" y="-71.12" smashed="yes" grouprefs="PMS1">
<attribute name="NAME" x="21.59" y="-68.58" size="1.778" layer="94"/>
<attribute name="VALUE" x="21.59" y="-74.93" size="1.778" layer="94"/>
</instance>
<instance part="GND4" gate="1" x="7.62" y="-40.64" smashed="yes" grouprefs="PMS1">
<attribute name="VALUE" x="5.08" y="-43.18" size="1.778" layer="96"/>
</instance>
<instance part="U3" gate="G$1" x="60.96" y="-40.64" smashed="yes" grouprefs="PMS1">
<attribute name="NAME" x="68.58" y="-35.56" size="1.778" layer="94"/>
</instance>
</instances>
<busses>
</busses>
<nets>
<net name="GND" class="0">
<segment>
<pinref part="GND1" gate="1" pin="GND"/>
<wire x1="68.58" y1="55.88" x2="99.06" y2="55.88" width="0.1524" layer="91" grouprefs="ESP1"/>
<pinref part="U2" gate="G$1" pin="GND"/>
</segment>
<segment>
<wire x1="-15.24" y1="38.1" x2="-10.16" y2="38.1" width="0.1524" layer="91" grouprefs="ESP1"/>
<wire x1="-10.16" y1="38.1" x2="-10.16" y2="35.56" width="0.1524" layer="91" grouprefs="ESP1"/>
<pinref part="GND9" gate="1" pin="GND"/>
<pinref part="J12" gate="G$1" pin="PIN_2"/>
</segment>
<segment>
<pinref part="GND2" gate="1" pin="GND"/>
<wire x1="152.4" y1="40.64" x2="193.04" y2="40.64" width="0.1524" layer="91" grouprefs="BME_280_TEMP_HUM1"/>
<pinref part="U5" gate="G$1" pin="GND"/>
</segment>
<segment>
<wire x1="172.72" y1="-93.98" x2="160.02" y2="-93.98" width="0.1524" layer="91" grouprefs="BH1"/>
<wire x1="160.02" y1="-93.98" x2="160.02" y2="-99.06" width="0.1524" layer="91" grouprefs="BH1"/>
<pinref part="GND5" gate="1" pin="GND"/>
<pinref part="U4" gate="G$1" pin="GND"/>
</segment>
<segment>
<pinref part="U6" gate="G$1" pin="GND"/>
<wire x1="185.42" y1="-17.78" x2="154.94" y2="-17.78" width="0.1524" layer="91" grouprefs="MH_Z19B_CO1"/>
<pinref part="GND13" gate="1" pin="GND"/>
</segment>
<segment>
<pinref part="Q3" gate="G$1" pin="E"/>
<pinref part="GND10" gate="1" pin="GND"/>
<wire x1="284.48" y1="-129.54" x2="284.48" y2="-132.08" width="0.1524" layer="91" grouprefs="IR1"/>
</segment>
<segment>
<pinref part="D2" gate="G$1" pin="GND"/>
<wire x1="332.74" y1="-50.8" x2="325.12" y2="-50.8" width="0.1524" layer="91" grouprefs="RGBLED1"/>
<wire x1="325.12" y1="-50.8" x2="325.12" y2="-55.88" width="0.1524" layer="91" grouprefs="RGBLED1"/>
<pinref part="GND7" gate="1" pin="GND"/>
</segment>
<segment>
<wire x1="48.26" y1="-111.76" x2="27.94" y2="-111.76" width="0.1524" layer="91" grouprefs="GY-SGP1"/>
<pinref part="GND6" gate="1" pin="GND"/>
<wire x1="27.94" y1="-111.76" x2="27.94" y2="-114.3" width="0.1524" layer="91" grouprefs="GY-SGP1"/>
<pinref part="U1" gate="G$1" pin="GND"/>
</segment>
<segment>
<wire x1="-30.48" y1="-101.6" x2="-22.86" y2="-101.6" width="0.1524" layer="91" grouprefs="5V_SUPPLY_JET1"/>
<wire x1="-22.86" y1="-101.6" x2="-22.86" y2="-96.52" width="0.1524" layer="91" grouprefs="5V_SUPPLY_JET1"/>
<wire x1="-22.86" y1="-96.52" x2="-15.24" y2="-96.52" width="0.1524" layer="91" grouprefs="5V_SUPPLY_JET1"/>
<pinref part="GND12" gate="1" pin="GND"/>
<pinref part="C1" gate="G$1" pin="PIN_GND"/>
<wire x1="-15.24" y1="-96.52" x2="-2.54" y2="-96.52" width="0.1524" layer="91" grouprefs="5V_SUPPLY_JET1"/>
<junction x="-15.24" y="-96.52"/>
<pinref part="J10" gate="G$1" pin="PIN_1"/>
</segment>
<segment>
<pinref part="U3" gate="G$1" pin="GND"/>
<wire x1="53.34" y1="-35.56" x2="7.62" y2="-35.56" width="0.1524" layer="91"/>
<pinref part="GND4" gate="1" pin="GND"/>
<wire x1="7.62" y1="-35.56" x2="7.62" y2="-38.1" width="0.1524" layer="91"/>
</segment>
<segment>
<pinref part="J5" gate="G$1" pin="PIN_1"/>
<pinref part="GND3" gate="1" pin="GND"/>
<wire x1="-185.42" y1="78.74" x2="-129.54" y2="78.74" width="0.1524" layer="91"/>
</segment>
<segment>
<wire x1="-154.94" y1="-30.48" x2="-154.94" y2="-25.4" width="0.1524" layer="91" grouprefs="ANEMOMETER1"/>
<pinref part="Q1" gate="G$1" pin="E"/>
<pinref part="GND11" gate="1" pin="GND"/>
<wire x1="-154.94" y1="-30.48" x2="-129.54" y2="-30.48" width="0.1524" layer="91"/>
<wire x1="-104.14" y1="-30.48" x2="-104.14" y2="-25.4" width="0.1524" layer="91" grouprefs="ANEMOMETER1"/>
<pinref part="Q2" gate="G$1" pin="E"/>
<wire x1="-129.54" y1="-30.48" x2="-104.14" y2="-30.48" width="0.1524" layer="91"/>
<junction x="-129.54" y="-30.48"/>
</segment>
</net>
<net name="I2C_SCL" class="0">
<segment>
<wire x1="68.58" y1="50.8" x2="81.28" y2="50.8" width="0.1524" layer="91"/>
<wire x1="81.28" y1="50.8" x2="81.28" y2="33.02" width="0.1524" layer="91" grouprefs="ESP1"/>
<wire x1="81.28" y1="33.02" x2="99.06" y2="33.02" width="0.1524" layer="91" grouprefs="ESP1"/>
<label x="88.9" y="33.02" size="1.778" layer="95" grouprefs="ESP1"/>
<pinref part="U2" gate="G$1" pin="IO23"/>
</segment>
<segment>
<wire x1="167.64" y1="20.32" x2="167.64" y2="38.1" width="0.1524" layer="91" grouprefs="BME_280_TEMP_HUM1"/>
<wire x1="167.64" y1="38.1" x2="193.04" y2="38.1" width="0.1524" layer="91" grouprefs="BME_280_TEMP_HUM1"/>
<label x="157.48" y="20.32" size="1.778" layer="95" grouprefs="BME_280_TEMP_HUM1"/>
<pinref part="U5" gate="G$1" pin="SCL"/>
</segment>
<segment>
<wire x1="172.72" y1="-91.44" x2="149.86" y2="-91.44" width="0.1524" layer="91" grouprefs="BH1"/>
<label x="149.86" y="-93.98" size="1.778" layer="95" grouprefs="BH1"/>
<pinref part="U4" gate="G$1" pin="I2C_SCL"/>
</segment>
<segment>
<wire x1="48.26" y1="-114.3" x2="33.02" y2="-114.3" width="0.1524" layer="91" grouprefs="GY-SGP1"/>
<wire x1="33.02" y1="-114.3" x2="33.02" y2="-121.92" width="0.1524" layer="91" grouprefs="GY-SGP1"/>
<wire x1="33.02" y1="-121.92" x2="22.86" y2="-121.92" width="0.1524" layer="91" grouprefs="GY-SGP1"/>
<label x="22.86" y="-124.46" size="1.778" layer="95" grouprefs="GY-SGP1"/>
<pinref part="U1" gate="G$1" pin="SCL"/>
</segment>
</net>
<net name="I2C_SDA" class="0">
<segment>
<wire x1="68.58" y1="43.18" x2="78.74" y2="43.18" width="0.1524" layer="91"/>
<wire x1="78.74" y1="43.18" x2="78.74" y2="25.4" width="0.1524" layer="91" grouprefs="ESP1"/>
<wire x1="78.74" y1="25.4" x2="99.06" y2="25.4" width="0.1524" layer="91" grouprefs="ESP1"/>
<label x="88.9" y="25.4" size="1.778" layer="95" grouprefs="ESP1"/>
<pinref part="U2" gate="G$1" pin="IO21"/>
</segment>
<segment>
<wire x1="180.34" y1="17.78" x2="180.34" y2="35.56" width="0.1524" layer="91" grouprefs="BME_280_TEMP_HUM1"/>
<wire x1="180.34" y1="35.56" x2="193.04" y2="35.56" width="0.1524" layer="91" grouprefs="BME_280_TEMP_HUM1"/>
<label x="180.34" y="17.78" size="1.778" layer="95" grouprefs="BME_280_TEMP_HUM1"/>
<pinref part="U5" gate="G$1" pin="SDA"/>
</segment>
<segment>
<wire x1="172.72" y1="-88.9" x2="149.86" y2="-88.9" width="0.1524" layer="91" grouprefs="BH1"/>
<label x="149.86" y="-88.9" size="1.778" layer="95" grouprefs="BH1"/>
<pinref part="U4" gate="G$1" pin="I2C_SDA"/>
</segment>
<segment>
<wire x1="48.26" y1="-116.84" x2="38.1" y2="-116.84" width="0.1524" layer="91" grouprefs="GY-SGP1"/>
<wire x1="38.1" y1="-116.84" x2="38.1" y2="-129.54" width="0.1524" layer="91" grouprefs="GY-SGP1"/>
<wire x1="38.1" y1="-129.54" x2="22.86" y2="-129.54" width="0.1524" layer="91" grouprefs="GY-SGP1"/>
<label x="22.86" y="-129.54" size="1.778" layer="95" grouprefs="GY-SGP1"/>
<pinref part="U1" gate="G$1" pin="SDA"/>
</segment>
</net>
<net name="3V3" class="0">
<segment>
<pinref part="R7" gate="G$1" pin="P$1"/>
<wire x1="5.08" y1="55.88" x2="-5.08" y2="55.88" width="0.1524" layer="91"/>
<wire x1="-7.62" y1="55.88" x2="-5.08" y2="55.88" width="0.1524" layer="91"/>
<label x="-7.62" y="55.88" size="1.778" layer="95"/>
</segment>
<segment>
<wire x1="48.26" y1="-109.22" x2="27.94" y2="-109.22" width="0.1524" layer="91" grouprefs="GY-SGP1"/>
<label x="27.94" y="-109.22" size="1.778" layer="95" grouprefs="GY-SGP1"/>
<pinref part="U1" gate="G$1" pin="VIN"/>
</segment>
<segment>
<wire x1="-154.94" y1="29.21" x2="-154.94" y2="33.02" width="0.1524" layer="91" grouprefs="ANEMOMETER1"/>
<wire x1="-154.94" y1="33.02" x2="-104.14" y2="33.02" width="0.1524" layer="91" grouprefs="ANEMOMETER1"/>
<wire x1="-104.14" y1="33.02" x2="-104.14" y2="29.21" width="0.1524" layer="91" grouprefs="ANEMOMETER1"/>
<wire x1="-104.14" y1="33.02" x2="-83.82" y2="33.02" width="0.1524" layer="91" grouprefs="ANEMOMETER1"/>
<junction x="-104.14" y="33.02" grouprefs="ANEMOMETER1"/>
<label x="-88.9" y="33.02" size="1.778" layer="95" grouprefs="ANEMOMETER1"/>
<pinref part="R2" gate="G$1" pin="P$2"/>
<pinref part="R5" gate="G$1" pin="P$2"/>
</segment>
<segment>
<wire x1="20.32" y1="-60.96" x2="15.24" y2="-60.96" width="0.1524" layer="91" grouprefs="PMS1"/>
<label x="5.08" y="-60.96" size="1.778" layer="95" grouprefs="PMS1"/>
<wire x1="20.32" y1="-71.12" x2="15.24" y2="-71.12" width="0.1524" layer="91" grouprefs="PMS1"/>
<wire x1="15.24" y1="-71.12" x2="15.24" y2="-60.96" width="0.1524" layer="91" grouprefs="PMS1"/>
<wire x1="15.24" y1="-60.96" x2="5.08" y2="-60.96" width="0.1524" layer="91" grouprefs="PMS1"/>
<junction x="15.24" y="-60.96" grouprefs="PMS1"/>
<pinref part="R8" gate="G$1" pin="P$1"/>
<pinref part="R9" gate="G$1" pin="P$1"/>
</segment>
<segment>
<wire x1="172.72" y1="-96.52" x2="165.1" y2="-96.52" width="0.1524" layer="91" grouprefs="BH1"/>
<wire x1="165.1" y1="-96.52" x2="165.1" y2="-109.22" width="0.1524" layer="91" grouprefs="BH1"/>
<wire x1="165.1" y1="-109.22" x2="147.32" y2="-109.22" width="0.1524" layer="91" grouprefs="BH1"/>
<label x="147.32" y="-109.22" size="1.778" layer="95" grouprefs="BH1"/>
<pinref part="U4" gate="G$1" pin="VCC"/>
</segment>
<segment>
<wire x1="193.04" y1="43.18" x2="177.8" y2="43.18" width="0.1524" layer="91" grouprefs="BME_280_TEMP_HUM1"/>
<wire x1="177.8" y1="43.18" x2="177.8" y2="53.34" width="0.1524" layer="91" grouprefs="BME_280_TEMP_HUM1"/>
<label x="175.26" y="53.34" size="1.778" layer="95" grouprefs="BME_280_TEMP_HUM1"/>
<pinref part="U5" gate="G$1" pin="VCC"/>
</segment>
</net>
<net name="UART_0_TXD" class="0">
<segment>
<wire x1="68.58" y1="48.26" x2="96.52" y2="48.26" width="0.1524" layer="91" grouprefs="ESP1"/>
<label x="81.28" y="48.26" size="1.778" layer="95" grouprefs="ESP1"/>
<pinref part="U2" gate="G$1" pin="TXD0"/>
</segment>
<segment>
<pinref part="U6" gate="G$1" pin="RX"/>
<wire x1="185.42" y1="-20.32" x2="165.1" y2="-20.32" width="0.1524" layer="91" grouprefs="MH_Z19B_CO1"/>
<label x="162.56" y="-20.32" size="1.778" layer="95" grouprefs="MH_Z19B_CO1"/>
</segment>
</net>
<net name="UART_0_RXD" class="0">
<segment>
<wire x1="68.58" y1="45.72" x2="96.52" y2="45.72" width="0.1524" layer="91" grouprefs="ESP1"/>
<label x="81.28" y="43.18" size="1.778" layer="95" grouprefs="ESP1"/>
<pinref part="U2" gate="G$1" pin="RXD0"/>
</segment>
<segment>
<pinref part="U6" gate="G$1" pin="TX"/>
<wire x1="185.42" y1="-22.86" x2="165.1" y2="-22.86" width="0.1524" layer="91" grouprefs="MH_Z19B_CO1"/>
<label x="162.56" y="-22.86" size="1.778" layer="95" grouprefs="MH_Z19B_CO1"/>
</segment>
</net>
<net name="UART_1_RXD" class="0">
<segment>
<wire x1="27.94" y1="17.78" x2="5.08" y2="17.78" width="0.1524" layer="91" grouprefs="ESP1"/>
<label x="5.08" y="17.78" size="1.778" layer="95" grouprefs="ESP1"/>
<pinref part="U2" gate="G$1" pin="SD2"/>
</segment>
<segment>
<wire x1="53.34" y1="-38.1" x2="15.24" y2="-38.1" width="0.1524" layer="91" grouprefs="PMS1"/>
<label x="15.24" y="-38.1" size="1.778" layer="95" grouprefs="PMS1"/>
<pinref part="U3" gate="G$1" pin="TXD"/>
</segment>
</net>
<net name="UART_1_TXD" class="0">
<segment>
<wire x1="27.94" y1="15.24" x2="5.08" y2="15.24" width="0.1524" layer="91" grouprefs="ESP1"/>
<label x="5.08" y="12.7" size="1.778" layer="95" grouprefs="ESP1"/>
<pinref part="U2" gate="G$1" pin="SD3"/>
</segment>
<segment>
<wire x1="53.34" y1="-40.64" x2="15.24" y2="-40.64" width="0.1524" layer="91" grouprefs="PMS1"/>
<label x="15.24" y="-40.64" size="1.778" layer="95" grouprefs="PMS1"/>
<pinref part="U3" gate="G$1" pin="RXD"/>
</segment>
</net>
<net name="GPIO_RGB_R" class="0">
<segment>
<wire x1="27.94" y1="35.56" x2="0" y2="35.56" width="0.1524" layer="91" grouprefs="ESP1"/>
<label x="0" y="35.56" size="1.778" layer="95" grouprefs="ESP1"/>
<pinref part="U2" gate="G$1" pin="IO25"/>
</segment>
<segment>
<pinref part="R13" gate="G$1" pin="P$1"/>
<wire x1="261.62" y1="-60.96" x2="243.84" y2="-60.96" width="0.1524" layer="91" grouprefs="RGBLED1"/>
<label x="238.76" y="-60.96" size="1.778" layer="95" grouprefs="RGBLED1"/>
</segment>
</net>
<net name="GPIO_RGB_G" class="0">
<segment>
<wire x1="27.94" y1="33.02" x2="0" y2="33.02" width="0.1524" layer="91" grouprefs="ESP1"/>
<label x="0" y="33.02" size="1.778" layer="95" grouprefs="ESP1"/>
<pinref part="U2" gate="G$1" pin="IO26"/>
</segment>
<segment>
<pinref part="R12" gate="G$1" pin="P$1"/>
<wire x1="261.62" y1="-43.18" x2="243.84" y2="-43.18" width="0.1524" layer="91" grouprefs="RGBLED1"/>
<label x="238.76" y="-43.18" size="1.778" layer="95" grouprefs="RGBLED1"/>
</segment>
</net>
<net name="GPIO_RGB_B" class="0">
<segment>
<wire x1="27.94" y1="30.48" x2="0" y2="30.48" width="0.1524" layer="91" grouprefs="ESP1"/>
<label x="0" y="30.48" size="1.778" layer="95" grouprefs="ESP1"/>
<pinref part="U2" gate="G$1" pin="IO27"/>
</segment>
<segment>
<pinref part="R11" gate="G$1" pin="P$1"/>
<wire x1="261.62" y1="-25.4" x2="243.84" y2="-25.4" width="0.1524" layer="91" grouprefs="RGBLED1"/>
<label x="238.76" y="-25.4" size="1.778" layer="95" grouprefs="RGBLED1"/>
</segment>
</net>
<net name="GPIO_AN_A" class="0">
<segment>
<wire x1="27.94" y1="45.72" x2="2.54" y2="45.72" width="0.1524" layer="91"/>
<label x="2.54" y="45.72" size="1.778" layer="95"/>
<pinref part="U2" gate="G$1" pin="IO34"/>
</segment>
<segment>
<wire x1="-135.89" y1="5.08" x2="-127" y2="5.08" width="0.1524" layer="91" grouprefs="ANEMOMETER1"/>
<label x="-137.16" y="2.54" size="1.778" layer="95" grouprefs="ANEMOMETER1"/>
<pinref part="R3" gate="G$1" pin="P$2"/>
</segment>
</net>
<net name="GPIO_AN_B" class="0">
<segment>
<wire x1="27.94" y1="43.18" x2="2.54" y2="43.18" width="0.1524" layer="91"/>
<label x="2.54" y="43.18" size="1.778" layer="95"/>
<pinref part="U2" gate="G$1" pin="IO35"/>
</segment>
<segment>
<wire x1="-85.09" y1="5.08" x2="-66.04" y2="5.08" width="0.1524" layer="91" grouprefs="ANEMOMETER1"/>
<label x="-78.74" y="2.54" size="1.778" layer="95" grouprefs="ANEMOMETER1"/>
<pinref part="R6" gate="G$1" pin="P$2"/>
</segment>
</net>
<net name="N$11" class="0">
<segment>
<wire x1="27.94" y1="40.64" x2="-15.24" y2="40.64" width="0.1524" layer="91" grouprefs="ESP1"/>
<pinref part="J12" gate="G$1" pin="PIN_1"/>
<pinref part="U2" gate="G$1" pin="IO32"/>
</segment>
</net>
<net name="N$24" class="0">
<segment>
<pinref part="R7" gate="G$1" pin="P$2"/>
<wire x1="27.94" y1="55.88" x2="21.59" y2="55.88" width="0.1524" layer="91"/>
<pinref part="U2" gate="G$1" pin="3V3"/>
</segment>
</net>
<net name="GPIO_IR" class="0">
<segment>
<wire x1="68.58" y1="20.32" x2="71.12" y2="20.32" width="0.1524" layer="91"/>
<wire x1="71.12" y1="20.32" x2="71.12" y2="10.16" width="0.1524" layer="91"/>
<wire x1="71.12" y1="10.16" x2="99.06" y2="10.16" width="0.1524" layer="91"/>
<label x="91.44" y="10.16" size="1.778" layer="95"/>
<pinref part="U2" gate="G$1" pin="IO2"/>
</segment>
<segment>
<pinref part="R10" gate="G$1" pin="P$1"/>
<wire x1="256.54" y1="-121.92" x2="248.92" y2="-121.92" width="0.1524" layer="91" grouprefs="IR1"/>
<label x="246.38" y="-121.92" size="1.778" layer="95" grouprefs="IR1"/>
</segment>
</net>
<net name="GPIO_TS" class="0">
<segment>
<wire x1="68.58" y1="25.4" x2="73.66" y2="25.4" width="0.1524" layer="91"/>
<wire x1="73.66" y1="25.4" x2="73.66" y2="12.7" width="0.1524" layer="91"/>
<wire x1="73.66" y1="12.7" x2="99.06" y2="12.7" width="0.1524" layer="91"/>
<label x="86.36" y="12.7" size="1.778" layer="95"/>
<pinref part="U2" gate="G$1" pin="IO4"/>
</segment>
<segment>
<pinref part="TS1" gate="G$1" pin="P$1"/>
<wire x1="294.64" y1="17.78" x2="269.24" y2="17.78" width="0.1524" layer="91" grouprefs="TOUCH_SENSOR1"/>
<label x="266.7" y="17.78" size="1.778" layer="95" grouprefs="TOUCH_SENSOR1"/>
</segment>
</net>
<net name="+5V" class="0">
<segment>
<pinref part="U6" gate="G$1" pin="VCC"/>
<wire x1="185.42" y1="-15.24" x2="165.1" y2="-15.24" width="0.1524" layer="91" grouprefs="MH_Z19B_CO1"/>
<label x="162.56" y="-15.24" size="1.778" layer="95" grouprefs="MH_Z19B_CO1"/>
</segment>
<segment>
<pinref part="R14" gate="G$1" pin="P$1"/>
<wire x1="266.7" y1="-93.98" x2="259.08" y2="-93.98" width="0.1524" layer="91" grouprefs="IR1"/>
<label x="259.08" y="-93.98" size="1.778" layer="95" grouprefs="IR1"/>
</segment>
<segment>
<pinref part="Q6" gate="G$1" pin="C"/>
<wire x1="294.64" y1="-53.34" x2="309.88" y2="-53.34" width="0.1524" layer="91" grouprefs="RGBLED1"/>
<wire x1="309.88" y1="-53.34" x2="309.88" y2="-35.56" width="0.1524" layer="91" grouprefs="RGBLED1"/>
<pinref part="Q4" gate="G$1" pin="C"/>
<wire x1="309.88" y1="-35.56" x2="309.88" y2="-22.86" width="0.1524" layer="91" grouprefs="RGBLED1"/>
<wire x1="309.88" y1="-22.86" x2="309.88" y2="-17.78" width="0.1524" layer="91" grouprefs="RGBLED1"/>
<wire x1="309.88" y1="-17.78" x2="294.64" y2="-17.78" width="0.1524" layer="91" grouprefs="RGBLED1"/>
<pinref part="Q5" gate="G$1" pin="C"/>
<wire x1="294.64" y1="-35.56" x2="309.88" y2="-35.56" width="0.1524" layer="91" grouprefs="RGBLED1"/>
<junction x="309.88" y="-35.56" grouprefs="RGBLED1"/>
<wire x1="309.88" y1="-22.86" x2="330.2" y2="-22.86" width="0.1524" layer="91" grouprefs="RGBLED1"/>
<junction x="309.88" y="-22.86" grouprefs="RGBLED1"/>
<label x="325.12" y="-22.86" size="1.778" layer="95" grouprefs="RGBLED1"/>
</segment>
<segment>
<wire x1="-30.48" y1="-104.14" x2="-22.86" y2="-104.14" width="0.1524" layer="91" grouprefs="5V_SUPPLY_JET1"/>
<wire x1="-22.86" y1="-104.14" x2="-22.86" y2="-109.22" width="0.1524" layer="91" grouprefs="5V_SUPPLY_JET1"/>
<wire x1="-22.86" y1="-109.22" x2="-15.24" y2="-109.22" width="0.1524" layer="91" grouprefs="5V_SUPPLY_JET1"/>
<label x="-5.08" y="-111.76" size="1.778" layer="95" grouprefs="5V_SUPPLY_JET1"/>
<pinref part="C1" gate="G$1" pin="PIN_PLUS"/>
<wire x1="-15.24" y1="-109.22" x2="-2.54" y2="-109.22" width="0.1524" layer="91" grouprefs="5V_SUPPLY_JET1"/>
<junction x="-15.24" y="-109.22"/>
<pinref part="J10" gate="G$1" pin="PIN_2"/>
</segment>
<segment>
<wire x1="-185.42" y1="76.2" x2="-139.7" y2="76.2" width="0.1524" layer="91" grouprefs="ANEMOMETER1"/>
<label x="-144.78" y="73.66" size="1.778" layer="95" grouprefs="ANEMOMETER1"/>
<pinref part="J5" gate="G$1" pin="PIN_2"/>
</segment>
<segment>
<wire x1="-146.05" y1="50.8" x2="-137.16" y2="50.8" width="0.1524" layer="91" grouprefs="ANEMOMETER1"/>
<label x="-139.7" y="50.8" size="1.778" layer="95" grouprefs="ANEMOMETER1"/>
<pinref part="R1" gate="G$1" pin="P$2"/>
</segment>
<segment>
<wire x1="-102.87" y1="50.8" x2="-91.44" y2="50.8" width="0.1524" layer="91" grouprefs="ANEMOMETER1"/>
<label x="-96.52" y="50.8" size="1.778" layer="95" grouprefs="ANEMOMETER1"/>
<pinref part="R4" gate="G$1" pin="P$2"/>
</segment>
<segment>
<wire x1="-5.08" y1="10.16" x2="27.94" y2="10.16" width="0.1524" layer="91" grouprefs="ESP1"/>
<label x="-5.08" y="10.16" size="1.778" layer="95" grouprefs="ESP1"/>
<pinref part="U2" gate="G$1" pin="5V"/>
</segment>
<segment>
<wire x1="53.34" y1="-33.02" x2="53.34" y2="-22.86" width="0.1524" layer="91" grouprefs="PMS1"/>
<wire x1="53.34" y1="-22.86" x2="7.62" y2="-22.86" width="0.1524" layer="91" grouprefs="PMS1"/>
<label x="7.62" y="-22.86" size="1.778" layer="95" grouprefs="PMS1"/>
<pinref part="U3" gate="G$1" pin="VCC"/>
</segment>
</net>
<net name="N$21" class="0">
<segment>
<pinref part="R11" gate="G$1" pin="P$2"/>
<wire x1="287.02" y1="-25.4" x2="278.13" y2="-25.4" width="0.1524" layer="91" grouprefs="RGBLED1"/>
<pinref part="Q4" gate="G$1" pin="B"/>
</segment>
</net>
<net name="N$22" class="0">
<segment>
<pinref part="R12" gate="G$1" pin="P$2"/>
<wire x1="287.02" y1="-43.18" x2="278.13" y2="-43.18" width="0.1524" layer="91" grouprefs="RGBLED1"/>
<pinref part="Q5" gate="G$1" pin="B"/>
</segment>
</net>
<net name="N$23" class="0">
<segment>
<pinref part="R13" gate="G$1" pin="P$2"/>
<wire x1="287.02" y1="-60.96" x2="278.13" y2="-60.96" width="0.1524" layer="91" grouprefs="RGBLED1"/>
<pinref part="Q6" gate="G$1" pin="B"/>
</segment>
</net>
<net name="N$25" class="0">
<segment>
<pinref part="D1" gate="G$1" pin="PIN_ANODE"/>
<pinref part="Q3" gate="G$1" pin="C"/>
<wire x1="284.48" y1="-111.76" x2="284.48" y2="-114.3" width="0.1524" layer="91" grouprefs="IR1"/>
</segment>
</net>
<net name="N$26" class="0">
<segment>
<pinref part="R14" gate="G$1" pin="P$2"/>
<wire x1="283.21" y1="-93.98" x2="284.48" y2="-93.98" width="0.1524" layer="91" grouprefs="IR1"/>
<pinref part="D1" gate="G$1" pin="PIN_CATHODE"/>
<wire x1="284.48" y1="-93.98" x2="284.48" y2="-99.06" width="0.1524" layer="91" grouprefs="IR1"/>
</segment>
</net>
<net name="N$27" class="0">
<segment>
<pinref part="Q3" gate="G$1" pin="B"/>
<pinref part="R10" gate="G$1" pin="P$2"/>
<wire x1="276.86" y1="-121.92" x2="273.05" y2="-121.92" width="0.1524" layer="91" grouprefs="IR1"/>
</segment>
</net>
<net name="N$1" class="0">
<segment>
<pinref part="Q4" gate="G$1" pin="E"/>
<wire x1="294.64" y1="-33.02" x2="332.74" y2="-33.02" width="0.1524" layer="91" grouprefs="RGBLED1"/>
<pinref part="D2" gate="G$1" pin="VIN_B"/>
<wire x1="332.74" y1="-33.02" x2="332.74" y2="-43.18" width="0.1524" layer="91" grouprefs="RGBLED1"/>
</segment>
</net>
<net name="N$2" class="0">
<segment>
<pinref part="Q5" gate="G$1" pin="E"/>
<wire x1="294.64" y1="-50.8" x2="304.8" y2="-50.8" width="0.1524" layer="91" grouprefs="RGBLED1"/>
<wire x1="304.8" y1="-50.8" x2="304.8" y2="-45.72" width="0.1524" layer="91" grouprefs="RGBLED1"/>
<pinref part="D2" gate="G$1" pin="VIN_G"/>
<wire x1="304.8" y1="-45.72" x2="332.74" y2="-45.72" width="0.1524" layer="91" grouprefs="RGBLED1"/>
</segment>
</net>
<net name="N$3" class="0">
<segment>
<pinref part="Q6" gate="G$1" pin="E"/>
<wire x1="294.64" y1="-68.58" x2="314.96" y2="-68.58" width="0.1524" layer="91" grouprefs="RGBLED1"/>
<wire x1="314.96" y1="-68.58" x2="314.96" y2="-48.26" width="0.1524" layer="91" grouprefs="RGBLED1"/>
<pinref part="D2" gate="G$1" pin="VIN_R"/>
<wire x1="314.96" y1="-48.26" x2="332.74" y2="-48.26" width="0.1524" layer="91" grouprefs="RGBLED1"/>
</segment>
</net>
<net name="N$5" class="0">
<segment>
<wire x1="-167.64" y1="63.5" x2="-167.64" y2="50.8" width="0.1524" layer="91" grouprefs="ANEMOMETER1"/>
<wire x1="-167.64" y1="50.8" x2="-167.64" y2="-17.78" width="0.1524" layer="91" grouprefs="ANEMOMETER1"/>
<wire x1="-167.64" y1="-17.78" x2="-162.56" y2="-17.78" width="0.1524" layer="91" grouprefs="ANEMOMETER1"/>
<wire x1="-167.64" y1="50.8" x2="-162.56" y2="50.8" width="0.1524" layer="91" grouprefs="ANEMOMETER1"/>
<junction x="-167.64" y="50.8" grouprefs="ANEMOMETER1"/>
<wire x1="-185.42" y1="63.5" x2="-167.64" y2="63.5" width="0.1524" layer="91" grouprefs="ANEMOMETER1"/>
<pinref part="Q1" gate="G$1" pin="B"/>
<pinref part="R1" gate="G$1" pin="P$1"/>
<pinref part="J6" gate="G$1" pin="PIN_2"/>
</segment>
</net>
<net name="N$4" class="0">
<segment>
<wire x1="-124.46" y1="66.04" x2="-124.46" y2="50.8" width="0.1524" layer="91" grouprefs="ANEMOMETER1"/>
<wire x1="-124.46" y1="50.8" x2="-124.46" y2="-17.78" width="0.1524" layer="91" grouprefs="ANEMOMETER1"/>
<wire x1="-124.46" y1="-17.78" x2="-111.76" y2="-17.78" width="0.1524" layer="91" grouprefs="ANEMOMETER1"/>
<wire x1="-124.46" y1="50.8" x2="-119.38" y2="50.8" width="0.1524" layer="91" grouprefs="ANEMOMETER1"/>
<junction x="-124.46" y="50.8" grouprefs="ANEMOMETER1"/>
<wire x1="-185.42" y1="66.04" x2="-124.46" y2="66.04" width="0.1524" layer="91" grouprefs="ANEMOMETER1"/>
<pinref part="Q2" gate="G$1" pin="B"/>
<pinref part="R4" gate="G$1" pin="P$1"/>
<pinref part="J6" gate="G$1" pin="PIN_1"/>
</segment>
</net>
<net name="N$6" class="0">
<segment>
<wire x1="-154.94" y1="-10.16" x2="-154.94" y2="5.08" width="0.1524" layer="91" grouprefs="ANEMOMETER1"/>
<wire x1="-154.94" y1="5.08" x2="-152.4" y2="5.08" width="0.1524" layer="91" grouprefs="ANEMOMETER1"/>
<wire x1="-154.94" y1="5.08" x2="-154.94" y2="12.7" width="0.1524" layer="91" grouprefs="ANEMOMETER1"/>
<junction x="-154.94" y="5.08" grouprefs="ANEMOMETER1"/>
<pinref part="Q1" gate="G$1" pin="C"/>
<pinref part="R3" gate="G$1" pin="P$1"/>
<pinref part="R2" gate="G$1" pin="P$1"/>
</segment>
</net>
<net name="N$7" class="0">
<segment>
<wire x1="-104.14" y1="-10.16" x2="-104.14" y2="5.08" width="0.1524" layer="91" grouprefs="ANEMOMETER1"/>
<wire x1="-104.14" y1="5.08" x2="-101.6" y2="5.08" width="0.1524" layer="91" grouprefs="ANEMOMETER1"/>
<wire x1="-104.14" y1="5.08" x2="-104.14" y2="12.7" width="0.1524" layer="91" grouprefs="ANEMOMETER1"/>
<junction x="-104.14" y="5.08" grouprefs="ANEMOMETER1"/>
<pinref part="Q2" gate="G$1" pin="C"/>
<pinref part="R6" gate="G$1" pin="P$1"/>
<pinref part="R5" gate="G$1" pin="P$1"/>
</segment>
</net>
<net name="N$8" class="0">
<segment>
<wire x1="38.1" y1="-60.96" x2="38.1" y2="-43.18" width="0.1524" layer="91" grouprefs="PMS1"/>
<wire x1="38.1" y1="-60.96" x2="36.83" y2="-60.96" width="0.1524" layer="91" grouprefs="PMS1"/>
<wire x1="53.34" y1="-43.18" x2="38.1" y2="-43.18" width="0.1524" layer="91" grouprefs="PMS1"/>
<pinref part="R8" gate="G$1" pin="P$2"/>
<pinref part="U3" gate="G$1" pin="RESET"/>
</segment>
</net>
<net name="N$28" class="0">
<segment>
<wire x1="53.34" y1="-45.72" x2="53.34" y2="-71.12" width="0.1524" layer="91" grouprefs="PMS1"/>
<pinref part="U3" gate="G$1" pin="SET"/>
<pinref part="R9" gate="G$1" pin="P$2"/>
<wire x1="53.34" y1="-71.12" x2="36.83" y2="-71.12" width="0.1524" layer="91"/>
</segment>
</net>
</nets>
</sheet>
</sheets>
<errors>
<approved hash="102,1,27.94,10.16,5V,+5V,,,,"/>
<approved hash="102,1,172.72,-96.52,VCC,3V3,,,,"/>
<approved hash="102,1,193.04,43.18,VCC,3V3,,,,"/>
<approved hash="102,1,53.34,-33.02,VCC,+5V,,,,"/>
<approved hash="201,1,53.34,-33.02,VCC,3V3\, +5V,,,,"/>
<approved hash="201,1,193.04,43.18,VCC,3V3\, +5V,,,,"/>
<approved hash="201,1,172.72,-96.52,VCC,3V3\, +5V,,,,"/>
<approved hash="104,1,27.94,55.88,U2,3V3,N$24,,,"/>
<approved hash="104,1,185.42,-15.24,U6,VCC,+5V,,,"/>
<approved hash="104,1,48.26,-109.22,U1,VIN,3V3,,,"/>
</errors>
</schematic>
</drawing>
<compatibility>
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
<note version="9.5" severity="warning">
Since Version 9.5, EAGLE supports persistent groups with
schematics, and board files. Those persistent groups
will not be understood (or retained) with this version.
</note>
</compatibility>
</eagle>
