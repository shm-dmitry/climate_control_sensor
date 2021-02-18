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
<layer number="16" name="Bottom" color="1" fill="1" visible="no" active="no"/>
<layer number="17" name="Pads" color="2" fill="1" visible="no" active="no"/>
<layer number="18" name="Vias" color="2" fill="1" visible="no" active="no"/>
<layer number="19" name="Unrouted" color="6" fill="1" visible="no" active="no"/>
<layer number="20" name="Dimension" color="15" fill="1" visible="no" active="no"/>
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
<layer number="51" name="tDocu" color="14" fill="1" visible="no" active="no"/>
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
</symbol>
</symbols>
<devicesets>
<deviceset name="ACDC">
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
<library name="con-amp" urn="urn:adsk.eagle:library:127">
<description>&lt;b&gt;AMP Connectors&lt;/b&gt;&lt;p&gt;

RJ45 Jack connectors&lt;br&gt;

 Based on the previous libraris:

 &lt;ul&gt;

 &lt;li&gt;amp.lbr

 &lt;li&gt;amp-j.lbr

 &lt;li&gt;amp-mta.lbr

 &lt;li&gt;amp-nlok.lbr

 &lt;li&gt;amp-sim.lbr

 &lt;li&gt;amp-micro-match.lbr

 &lt;/ul&gt;

 Sources :

 &lt;ul&gt;

 &lt;li&gt;Catalog 82066 Revised 11-95 

 &lt;li&gt;Product Guide 296785 Rev. 8-99

 &lt;li&gt;Product Guide CD-ROM 1999

 &lt;li&gt;www.amp.com

 &lt;/ul&gt;

 &lt;author&gt;Created by librarian@cadsoft.de&lt;/author&gt;</description>
<packages>
<package name="10X02MTA" urn="urn:adsk.eagle:footprint:8080361/1" library_version="4">
<description>&lt;b&gt;AMP MTA connector&lt;/b&gt;&lt;p&gt;
Source: http://ecommas.tycoelectronics.com .. ENG_CD_640456_W.pdf</description>
<wire x1="-2.54" y1="-1.27" x2="-2.54" y2="1.27" width="0.1524" layer="21"/>
<wire x1="2.54" y1="1.27" x2="-2.54" y2="1.27" width="0.1524" layer="21"/>
<wire x1="-2.54" y1="-1.27" x2="2.54" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="-2.54" y1="1.27" x2="-2.54" y2="1.905" width="0.1524" layer="21"/>
<wire x1="2.54" y1="1.905" x2="-2.54" y2="1.905" width="0.1524" layer="21"/>
<wire x1="2.54" y1="1.27" x2="2.54" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="2.54" y1="1.905" x2="2.54" y2="1.27" width="0.1524" layer="21"/>
<pad name="2" x="-1.27" y="0" drill="1.016" shape="long" rot="R90"/>
<pad name="1" x="1.27" y="0" drill="1.016" shape="long" rot="R90"/>
<text x="-2.6162" y="-3.2512" size="1.27" layer="25">&gt;NAME</text>
<text x="-2.5461" y="2.1509" size="1.27" layer="27">&gt;VALUE</text>
<rectangle x1="1.016" y1="-0.254" x2="1.524" y2="0.254" layer="21"/>
<rectangle x1="-1.524" y1="-0.254" x2="-1.016" y2="0.254" layer="21"/>
</package>
</packages>
<packages3d>
<package3d name="10X02MTA" urn="urn:adsk.eagle:package:8081649/1" type="box" library_version="4">
<description>&lt;b&gt;AMP MTA connector&lt;/b&gt;&lt;p&gt;
Source: http://ecommas.tycoelectronics.com .. ENG_CD_640456_W.pdf</description>
<packageinstances>
<packageinstance name="10X02MTA"/>
</packageinstances>
</package3d>
</packages3d>
<symbols>
<symbol name="MTA-1_2" urn="urn:adsk.eagle:symbol:8079840/1" library_version="4">
<wire x1="-1.27" y1="1.27" x2="-1.27" y2="-1.905" width="0.254" layer="94"/>
<wire x1="3.81" y1="-1.905" x2="-1.27" y2="-1.905" width="0.254" layer="94"/>
<wire x1="3.81" y1="-1.905" x2="3.81" y2="1.27" width="0.254" layer="94"/>
<wire x1="-1.27" y1="1.27" x2="3.81" y2="1.27" width="0.254" layer="94"/>
<circle x="0" y="0" radius="0.635" width="0.254" layer="94"/>
<circle x="2.54" y="0" radius="0.635" width="0.254" layer="94"/>
<text x="5.08" y="0" size="1.778" layer="95">&gt;NAME</text>
<text x="5.08" y="-3.81" size="1.778" layer="96">&gt;VALUE</text>
<text x="-2.54" y="-1.27" size="1.27" layer="95">1</text>
<pin name="1" x="0" y="-2.54" visible="off" length="short" direction="pas" rot="R90"/>
<pin name="2" x="2.54" y="-2.54" visible="off" length="short" direction="pas" rot="R90"/>
</symbol>
</symbols>
<devicesets>
<deviceset name="MTA02-100" urn="urn:adsk.eagle:component:8082823/2" prefix="J" uservalue="yes" library_version="4">
<description>&lt;b&gt;AMP connector&lt;/b&gt;</description>
<gates>
<gate name="G$1" symbol="MTA-1_2" x="0" y="0"/>
</gates>
<devices>
<device name="" package="10X02MTA">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<package3dinstances>
<package3dinstance package3d_urn="urn:adsk.eagle:package:8081649/1"/>
</package3dinstances>
<technologies>
<technology name="">
<attribute name="POPULARITY" value="5" constant="no"/>
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
<schematic_group name="ACDC1"/>
<schematic_group name="220V1"/>
</groups>
<parts>
<part name="SUPPLY1" library="supply2" library_urn="urn:adsk.eagle:library:372" deviceset="VCC" device=""/>
<part name="SUPPLY2" library="supply2" library_urn="urn:adsk.eagle:library:372" deviceset="VCC" device=""/>
<part name="U$9" library="my_devices" deviceset="ACDC" device=""/>
<part name="J3" library="con-amp" library_urn="urn:adsk.eagle:library:127" deviceset="MTA02-100" device="" package3d_urn="urn:adsk.eagle:package:8081649/1"/>
</parts>
<sheets>
<sheet>
<plain>
</plain>
<instances>
<instance part="SUPPLY1" gate="G$1" x="-60.96" y="43.18" smashed="yes" grouprefs="220V1">
<attribute name="VALUE" x="-62.865" y="46.355" size="1.778" layer="96"/>
</instance>
<instance part="SUPPLY2" gate="G$1" x="-43.18" y="43.18" smashed="yes" grouprefs="220V1">
<attribute name="VALUE" x="-45.085" y="46.355" size="1.778" layer="96"/>
</instance>
<instance part="U$9" gate="G$1" x="10.16" y="17.78" smashed="yes" grouprefs="ACDC1"/>
<instance part="J3" gate="G$1" x="60.96" y="20.32" smashed="yes" rot="R270" grouprefs="ACDC1">
<attribute name="NAME" x="60.96" y="15.24" size="1.778" layer="95" rot="R270"/>
<attribute name="VALUE" x="57.15" y="15.24" size="1.778" layer="96" rot="R270"/>
</instance>
</instances>
<busses>
</busses>
<nets>
<net name="VCC" class="0">
<segment>
<pinref part="SUPPLY2" gate="G$1" pin="VCC"/>
<wire x1="-43.18" y1="40.64" x2="-43.18" y2="22.86" width="0.1524" layer="91"/>
<wire x1="-43.18" y1="22.86" x2="-15.24" y2="22.86" width="0.1524" layer="91"/>
<pinref part="U$9" gate="G$1" pin="220V_L"/>
</segment>
</net>
<net name="N$9" class="0">
<segment>
<pinref part="SUPPLY1" gate="G$1" pin="VCC"/>
<wire x1="-60.96" y1="40.64" x2="-60.96" y2="12.7" width="0.1524" layer="91"/>
<wire x1="-60.96" y1="12.7" x2="-15.24" y2="12.7" width="0.1524" layer="91"/>
<pinref part="U$9" gate="G$1" pin="220V_N"/>
</segment>
</net>
<net name="OUT_GND" class="0">
<segment>
<pinref part="U$9" gate="G$1" pin="OUT_GND"/>
<wire x1="35.56" y1="22.86" x2="53.34" y2="22.86" width="0.1524" layer="91"/>
<wire x1="53.34" y1="22.86" x2="53.34" y2="20.32" width="0.1524" layer="91" grouprefs="ACDC1"/>
<pinref part="J3" gate="G$1" pin="1"/>
<wire x1="53.34" y1="20.32" x2="58.42" y2="20.32" width="0.1524" layer="91" grouprefs="ACDC1"/>
</segment>
</net>
<net name="ACDC_OUT_5V" class="0">
<segment>
<wire x1="35.56" y1="12.7" x2="50.8" y2="12.7" width="0.1524" layer="91" grouprefs="ACDC1"/>
<label x="48.26" y="10.16" size="1.778" layer="95" grouprefs="ACDC1"/>
<pinref part="U$9" gate="G$1" pin="OUT_5V"/>
<wire x1="50.8" y1="12.7" x2="50.8" y2="17.78" width="0.1524" layer="91" grouprefs="ACDC1"/>
<pinref part="J3" gate="G$1" pin="2"/>
<wire x1="50.8" y1="17.78" x2="58.42" y2="17.78" width="0.1524" layer="91" grouprefs="ACDC1"/>
</segment>
</net>
</nets>
</sheet>
</sheets>
<errors>
<approved hash="102,1,-60.96,40.64,VCC,N$9,,,,"/>
<approved hash="201,1,-60.96,40.64,VCC,N$9\, VCC,,,,"/>
<approved hash="104,1,-15.24,22.86,U$9,220V_L,VCC,,,"/>
<approved hash="104,1,-15.24,12.7,U$9,220V_N,N$9,,,"/>
<approved hash="104,1,35.56,12.7,U$9,OUT_5V,ACDC_OUT_5V,,,"/>
<approved hash="106,1,-60.96,40.64,N$9,,,,,"/>
<approved hash="106,1,-15.24,12.7,N$9,,,,,"/>
<approved hash="106,1,-43.18,40.64,VCC,,,,,"/>
<approved hash="106,1,-15.24,22.86,VCC,,,,,"/>
<approved hash="113,1,58.8112,17.6643,J3,,,,,"/>
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
