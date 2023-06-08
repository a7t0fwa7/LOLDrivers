
rule MAL_Driver_MicrosoftCorporation_windbgsys_MicrosoftWindowsOperatingSystem_zUjz {
	meta:
		description = "Detects $$$type$$$ driver mentioned in LOLDrivers project using VersionInfo values from the PE header - windbg.sys"
		author = "Florian Roth"
		reference = "https://github.com/magicsword-io/LOLDrivers"
		hash = "6994b32e3f3357f4a1d0abe81e8b62dd54e36b17816f2f1a80018584200a1b77"
		hash = "5b932eab6c67f62f097a3249477ac46d80ddccdc52654f8674060b4ddf638e5d"
		hash = "ea50f22daade04d3ca06dedb497b905215cba31aae7b4cab4b533fda0c5be620"
		hash = "f936ec4c8164cbd31add659b61c16cb3a717eac90e74d89c47afb96b60120280"
		hash = "32882949ea084434a376451ff8364243a50485a3b4af2f2240bb5f20c164543d"
		hash = "6661320f779337b95bbbe1943ee64afb2101c92f92f3d1571c1bf4201c38c724"
		hash = "86047bb1969d1db455493955fd450d18c62a3f36294d0a6c3732c88dfbcc4f62"
		hash = "06c5ebd0371342d18bc81a96f5e5ce28de64101e3c2fd0161d0b54d8368d2f1f"
		hash = "4734a0a5d88f44a4939b8d812364cab6ca5f611b9b8ceebe27df6c1ed3a6d8a4"
		hash = "770f33259d6fb10f4a32d8a57d0d12953e8455c72bb7b60cb39ce505c507013a"
		hash = "50819a1add4c81c0d53203592d6803f022443440935ff8260ff3b6d5253c0c76"
		hash = "f9f2091fccb289bcf6a945f6b38676ec71dedb32f3674262928ccaf840ca131a"
		hash = "fa9abb3e7e06f857be191a1e049dd37642ec41fb2520c105df2227fcac3de5d5"
		hash = "139f8412a7c6fdc43dcfbbcdba256ee55654eb36a40f338249d5162a1f69b988"
		hash = "e1cb86386757b947b39086cc8639da988f6e8018ca9995dd669bdc03c8d39d7d"
		hash = "e6f764c3b5580cd1675cbf184938ad5a201a8c096607857869bd7c3399df0d12"
		hash = "bb2422e96ea993007f25c71d55b2eddfa1e940c89e895abb50dd07d7c17ca1df"
		date = "2023-06-08"
		score = 85
	strings:
		$ = { 00460069006c0065004400650073006300720069007000740069006f006e[1-8]00570069006e0064006f007700730020004700550049002000730079006d0062006f006c00690063002000640065006200750067006700650072 } /* FileDescription Windows GUI symbolic debugger */
		$ = { 0043006f006d00700061006e0079004e0061006d0065[1-8]004d006900630072006f0073006f0066007400200043006f00720070006f0072006100740069006f006e } /* CompanyName Microsoft Corporation */
		$ = { 00460069006c006500560065007200730069006f006e[1-8]00310030002e0030002e00310039003000340031002e0036003800350020002800570069006e004200750069006c0064002e003100360030003100300031002e00300038003000300029 } /* FileVersion 10.0.19041.685 (WinBuild.160101.0800) */
		$ = { 00500072006f006400750063007400560065007200730069006f006e[1-8]00310030002e0030002e00310039003000340031002e003600380035 } /* ProductVersion 10.0.19041.685 */
		$ = { 0049006e007400650072006e0061006c004e0061006d0065[1-8]00770069006e006400620067002e007300790073 } /* InternalName windbg.sys */
		$ = { 00500072006f0064007500630074004e0061006d0065[1-8]004d006900630072006f0073006f00660074003f002000570069006e0064006f00770073003f0020004f007000650072006100740069006e0067002000530079007300740065006d } /* ProductName Microsoft? Windows? Operating System */
		$ = { 004f0072006900670069006e0061006c00460069006c0065006e0061006d0065[1-8]00770069006e006400620067002e007300790073 } /* OriginalFilename windbg.sys */
		$ = { 004c006500670061006c0043006f0070007900720069006700680074[1-8]003f0020004d006900630072006f0073006f0066007400200043006f00720070006f0072006100740069006f006e002e00200041006c006c0020007200690067006800740073002000720065007300650072007600650064002e } /* LegalCopyright ? Microsoft Corporation. All rights reserved. */
	condition:
		uint16(0) == 0x5a4d and filesize < 6600KB and all of them
}


rule MAL_Driver_SenseCORP__8RUa {
	meta:
		description = "Detects $$$type$$$ driver mentioned in LOLDrivers project using VersionInfo values from the PE header - Sense5Ext.sys"
		author = "Florian Roth"
		reference = "https://github.com/magicsword-io/LOLDrivers"
		hash = "42b22faa489b5de936db33f12184f6233198bdf851a18264d31210207827ba25"
		date = "2023-06-08"
		score = 85
	strings:
		$ = { 00460069006c0065004400650073006300720069007000740069006f006e[1-8]00530065006e0073006500350020004400720069007600650072 } /* FileDescription Sense5 Driver */
		$ = { 0043006f006d00700061006e0079004e0061006d0065[1-8]00530065006e00730065003500200043004f00520050 } /* CompanyName Sense5 CORP */
		$ = { 00460069006c006500560065007200730069006f006e[1-8]0032002e0035002e0030002e0030 } /* FileVersion 2.5.0.0 */
		$ = { 00500072006f006400750063007400560065007200730069006f006e[1-8]0032002e0035002e0030002e0030 } /* ProductVersion 2.5.0.0 */
		$ = { 004c006500670061006c0043006f0070007900720069006700680074[1-8]0043006f0070007900720069006700680074002000280043002900200032003000320032 } /* LegalCopyright Copyright (C) 2022 */
	condition:
		uint16(0) == 0x5a4d and filesize < 4400KB and all of them
}


rule MAL_Driver_LegalCorp_PCIExpressVideoCapture_6AiP {
	meta:
		description = "Detects $$$type$$$ driver mentioned in LOLDrivers project using VersionInfo values from the PE header - PcieCubed.sys"
		author = "Florian Roth"
		reference = "https://github.com/magicsword-io/LOLDrivers"
		hash = "fd223833abffa9cd6cc1848d77599673643585925a7ee51259d67c44d361cce8"
		date = "2023-06-08"
		score = 85
	strings:
		$ = { 00460069006c0065004400650073006300720069007000740069006f006e[1-8]005000430049006500200056006900640065006f00200043006100700074007500720065 } /* FileDescription PCIe Video Capture */
		$ = { 0043006f006d00700061006e0079004e0061006d0065[1-8]004c006500670061006c00200043006f00720070002e } /* CompanyName Legal Corp. */
		$ = { 00460069006c006500560065007200730069006f006e[1-8]0031002e0030002e0030002e00310035 } /* FileVersion 1.0.0.15 */
		$ = { 00500072006f006400750063007400560065007200730069006f006e[1-8]0031002e0030002e0030002e00310035 } /* ProductVersion 1.0.0.15 */
		$ = { 00500072006f0064007500630074004e0061006d0065[1-8]0050004300490020004500780070007200650073007300200056006900640065006f00200043006100700074007500720065 } /* ProductName PCI Express Video Capture */
		$ = { 004f0072006900670069006e0061006c00460069006c0065006e0061006d0065[1-8]005000630069006500430075006200650064002e007300790073 } /* OriginalFilename PcieCubed.sys */
		$ = { 004c006500670061006c0043006f0070007900720069006700680074[1-8]00320030003100360020004c006500670061006c } /* LegalCopyright 2016 Legal */
	condition:
		uint16(0) == 0x5a4d and filesize < 600KB and all of them
}


rule MAL_Driver_MicrosoftCorporation_ntbiosys_MicrosoftRWindowsRNTOperatingSystem_3kiC {
	meta:
		description = "Detects $$$type$$$ driver mentioned in LOLDrivers project using VersionInfo values from the PE header - ntbios_2.sys"
		author = "Florian Roth"
		reference = "https://github.com/magicsword-io/LOLDrivers"
		hash = "c0d88db11d0f529754d290ed5f4c34b4dba8c4f2e5c4148866daabeab0d25f9c"
		hash = "96bf3ee7c6673b69c6aa173bb44e21fa636b1c2c73f4356a7599c121284a51cc"
		date = "2023-06-08"
		score = 85
	strings:
		$ = { 00460069006c0065004400650073006300720069007000740069006f006e[1-8]006e007400620069006f00730020006400720069007600650072 } /* FileDescription ntbios driver */
		$ = { 0043006f006d00700061006e0079004e0061006d0065[1-8]004d006900630072006f0073006f0066007400200043006f00720070006f0072006100740069006f006e } /* CompanyName Microsoft Corporation */
		$ = { 00460069006c006500560065007200730069006f006e[1-8]0035002c00200030002c00200032002c00200031 } /* FileVersion 5, 0, 2, 1 */
		$ = { 00500072006f006400750063007400560065007200730069006f006e[1-8]0035002c00200030002c00200032002c00200031 } /* ProductVersion 5, 0, 2, 1 */
		$ = { 0049006e007400650072006e0061006c004e0061006d0065[1-8]006e007400620069006f002e007300790073 } /* InternalName ntbio.sys */
		$ = { 00500072006f0064007500630074004e0061006d0065[1-8]0020004d006900630072006f0073006f00660074002800520029002000570069006e0064006f0077007300200028005200290020004e00540020004f007000650072006100740069006e0067002000530079007300740065006d } /* ProductName  Microsoft(R) Windows (R) NT Operating System */
		$ = { 004f0072006900670069006e0061006c00460069006c0065006e0061006d0065[1-8]006e007400620069006f0073002e007300790073 } /* OriginalFilename ntbios.sys */
		$ = { 004c006500670061006c0043006f0070007900720069006700680074[1-8]7248674362406709002000280043002900200032003000300033 } /* LegalCopyright 版权所有 (C) 2003 */
	condition:
		uint16(0) == 0x5a4d and filesize < 100KB and all of them
}


rule MAL_Driver_gentilkiwiBenjaminDELPY_mimidrv_mimidrvmimikatz_bX7Z {
	meta:
		description = "Detects $$$type$$$ driver mentioned in LOLDrivers project using VersionInfo values from the PE header - mimidrv.sys"
		author = "Florian Roth"
		reference = "https://github.com/magicsword-io/LOLDrivers"
		hash = "200f98655d1f46d2599c2c8605ebb7e335fee3883a32135ca1a81e09819bc64a"
		date = "2023-06-08"
		score = 85
	strings:
		$ = { 00460069006c0065004400650073006300720069007000740069006f006e[1-8]006d0069006d006900640072007600200066006f0072002000570069006e0064006f0077007300200028006d0069006d0069006b00610074007a0029 } /* FileDescription mimidrv for Windows (mimikatz) */
		$ = { 0043006f006d00700061006e0079004e0061006d0065[1-8]00670065006e00740069006c006b0069007700690020002800420065006e006a0061006d0069006e002000440045004c005000590029 } /* CompanyName gentilkiwi (Benjamin DELPY) */
		$ = { 00460069006c006500560065007200730069006f006e[1-8]0032002e0032002e0030002e0030 } /* FileVersion 2.2.0.0 */
		$ = { 00500072006f006400750063007400560065007200730069006f006e[1-8]0032002e0032002e0030002e0030 } /* ProductVersion 2.2.0.0 */
		$ = { 0049006e007400650072006e0061006c004e0061006d0065[1-8]006d0069006d0069006400720076 } /* InternalName mimidrv */
		$ = { 00500072006f0064007500630074004e0061006d0065[1-8]006d0069006d006900640072007600200028006d0069006d0069006b00610074007a0029 } /* ProductName mimidrv (mimikatz) */
		$ = { 004f0072006900670069006e0061006c00460069006c0065006e0061006d0065[1-8]006d0069006d0069006400720076002e007300790073 } /* OriginalFilename mimidrv.sys */
		$ = { 004c006500670061006c0043006f0070007900720069006700680074[1-8]0043006f00700079007200690067006800740020002800630029002000320030003000370020002d00200032003000310039002000670065006e00740069006c006b0069007700690020002800420065006e006a0061006d0069006e002000440045004c005000590029 } /* LegalCopyright Copyright (c) 2007 - 2019 gentilkiwi (Benjamin DELPY) */
	condition:
		uint16(0) == 0x5a4d and filesize < 100KB and all of them
}


rule MAL_Driver_MicrosoftCorporation_wantdsys_MicrosoftWindowsOperatingSystem_85Hk {
	meta:
		description = "Detects $$$type$$$ driver mentioned in LOLDrivers project using VersionInfo values from the PE header - wantd_6.sys"
		author = "Florian Roth"
		reference = "https://github.com/magicsword-io/LOLDrivers"
		hash = "e7af7bcb86bd6bab1835f610671c3921441965a839673ac34444cf0ce7b2164e"
		hash = "b9dad0131c51e2645e761b74a71ebad2bf175645fa9f42a4ab0e6921b83306e3"
		hash = "8d9a2363b757d3f127b9c6ed8f7b8b018e652369bc070aa3500b3a978feaa6ce"
		hash = "06a0ec9a316eb89cb041b1907918e3ad3b03842ec65f004f6fa74d57955573a4"
		date = "2023-06-08"
		score = 85
	strings:
		$ = { 00460069006c0065004400650073006300720069007000740069006f006e[1-8]00570041004e0020005400720061006e00730070006f007200740020004400720069007600650072 } /* FileDescription WAN Transport Driver */
		$ = { 0043006f006d00700061006e0079004e0061006d0065[1-8]004d006900630072006f0073006f0066007400200043006f00720070006f0072006100740069006f006e } /* CompanyName Microsoft Corporation */
		$ = { 00460069006c006500560065007200730069006f006e[1-8]0036002e0031002e0037003600300030002e0031003100370032 } /* FileVersion 6.1.7600.1172 */
		$ = { 00500072006f006400750063007400560065007200730069006f006e[1-8]0036002e0031002e0037003600300030002e0031003100370032 } /* ProductVersion 6.1.7600.1172 */
		$ = { 0049006e007400650072006e0061006c004e0061006d0065[1-8]00770061006e00740064002e007300790073 } /* InternalName wantd.sys */
		$ = { 00500072006f0064007500630074004e0061006d0065[1-8]004d006900630072006f0073006f00660074002000570069006e0064006f007700730020004f007000650072006100740069006e0067002000530079007300740065006d } /* ProductName Microsoft Windows Operating System */
		$ = { 004f0072006900670069006e0061006c00460069006c0065006e0061006d0065[1-8]00770061006e00740064002e007300790073 } /* OriginalFilename wantd.sys */
		$ = { 004c006500670061006c0043006f0070007900720069006700680074[1-8]004d006900630072006f0073006f0066007400200043006f00720070006f0072006100740069006f006e002e00200041006c006c0020007200690067006800740073002000720065007300650072007600650064002e } /* LegalCopyright Microsoft Corporation. All rights reserved. */
	condition:
		uint16(0) == 0x5a4d and filesize < 100KB and all of them
}


rule MAL_Driver_GMER_gmersys_GMER_8CE7 {
	meta:
		description = "Detects $$$type$$$ driver mentioned in LOLDrivers project using VersionInfo values from the PE header - gmer64.sys"
		author = "Florian Roth"
		reference = "https://github.com/magicsword-io/LOLDrivers"
		hash = "18c909a2b8c5e16821d6ef908f56881aa0ecceeaccb5fa1e54995935fcfd12f7"
		date = "2023-06-08"
		score = 85
	strings:
		$ = { 00460069006c0065004400650073006300720069007000740069006f006e[1-8]0047004d00450052002000440072006900760065007200200068007400740070003a002f002f007700770077002e0067006d00650072002e006e00650074 } /* FileDescription GMER Driver http://www.gmer.net */
		$ = { 0043006f006d00700061006e0079004e0061006d0065[1-8]0047004d00450052 } /* CompanyName GMER */
		$ = { 00460069006c006500560065007200730069006f006e[1-8]0032002c00200030002c002000360039003800330020006200750069006c0074002000620079003a002000570069006e00440044004b } /* FileVersion 2, 0, 6983 built by: WinDDK */
		$ = { 00500072006f006400750063007400560065007200730069006f006e[1-8]0032002c00200030002c00200036003900380033 } /* ProductVersion 2, 0, 6983 */
		$ = { 0049006e007400650072006e0061006c004e0061006d0065[1-8]0067006d0065007200360034002e007300790073 } /* InternalName gmer64.sys */
		$ = { 00500072006f0064007500630074004e0061006d0065[1-8]0047004d00450052 } /* ProductName GMER */
		$ = { 004f0072006900670069006e0061006c00460069006c0065006e0061006d0065[1-8]0067006d0065007200360034002e007300790073 } /* OriginalFilename gmer64.sys */
		$ = { 004c006500670061006c0043006f0070007900720069006700680074[1-8]0043006f0070007900720069006700680074002000280043002900200047004d0045005200200032003000300033002d0032003000310033 } /* LegalCopyright Copyright (C) GMER 2003-2013 */
	condition:
		uint16(0) == 0x5a4d and filesize < 100KB and all of them
}


rule MAL_Driver_MicrosoftCorporation_wantdsys_MicrosoftWindowsOperatingSystem_5MzP {
	meta:
		description = "Detects $$$type$$$ driver mentioned in LOLDrivers project using VersionInfo values from the PE header - wantd_2.sys"
		author = "Florian Roth"
		reference = "https://github.com/magicsword-io/LOLDrivers"
		hash = "6908ebf52eb19c6719a0b508d1e2128f198d10441551cbfb9f4031d382f5229f"
		date = "2023-06-08"
		score = 85
	strings:
		$ = { 00460069006c0065004400650073006300720069007000740069006f006e[1-8]00570041004e0020005400720061006e00730070006f007200740020004400720069007600650072 } /* FileDescription WAN Transport Driver */
		$ = { 0043006f006d00700061006e0079004e0061006d0065[1-8]004d006900630072006f0073006f0066007400200043006f00720070006f0072006100740069006f006e } /* CompanyName Microsoft Corporation */
		$ = { 00460069006c006500560065007200730069006f006e[1-8]0036002e0031002e0037003600300030002e003900330038 } /* FileVersion 6.1.7600.938 */
		$ = { 00500072006f006400750063007400560065007200730069006f006e[1-8]0036002e0031002e0037003600300030002e003900330038 } /* ProductVersion 6.1.7600.938 */
		$ = { 0049006e007400650072006e0061006c004e0061006d0065[1-8]00770061006e00740064002e007300790073 } /* InternalName wantd.sys */
		$ = { 00500072006f0064007500630074004e0061006d0065[1-8]004d006900630072006f0073006f00660074002000570069006e0064006f007700730020004f007000650072006100740069006e0067002000530079007300740065006d } /* ProductName Microsoft Windows Operating System */
		$ = { 004f0072006900670069006e0061006c00460069006c0065006e0061006d0065[1-8]00770061006e00740064002e007300790073 } /* OriginalFilename wantd.sys */
		$ = { 004c006500670061006c0043006f0070007900720069006700680074[1-8]004d006900630072006f0073006f0066007400200043006f00720070006f0072006100740069006f006e002e00200041006c006c0020007200690067006800740073002000720065007300650072007600650064002e } /* LegalCopyright Microsoft Corporation. All rights reserved. */
	condition:
		uint16(0) == 0x5a4d and filesize < 100KB and all of them
}


rule MAL_Driver_MicrosoftCorporation_wantdsys_MicrosoftWindowsOperatingSystem_5k4R {
	meta:
		description = "Detects $$$type$$$ driver mentioned in LOLDrivers project using VersionInfo values from the PE header - wantd_3.sys"
		author = "Florian Roth"
		reference = "https://github.com/magicsword-io/LOLDrivers"
		hash = "81c7bb39100d358f8286da5e9aa838606c98dfcc263e9a82ed91cd438cb130d1"
		date = "2023-06-08"
		score = 85
	strings:
		$ = { 00460069006c0065004400650073006300720069007000740069006f006e[1-8]00570041004e0020005400720061006e00730070006f007200740020004400720069007600650072 } /* FileDescription WAN Transport Driver */
		$ = { 0043006f006d00700061006e0079004e0061006d0065[1-8]004d006900630072006f0073006f0066007400200043006f00720070006f0072006100740069006f006e } /* CompanyName Microsoft Corporation */
		$ = { 00460069006c006500560065007200730069006f006e[1-8]0035002e0032002e0033003700390030002e003900330038 } /* FileVersion 5.2.3790.938 */
		$ = { 00500072006f006400750063007400560065007200730069006f006e[1-8]0035002e0032002e0033003700390030002e003900330038 } /* ProductVersion 5.2.3790.938 */
		$ = { 0049006e007400650072006e0061006c004e0061006d0065[1-8]00770061006e00740064002e007300790073 } /* InternalName wantd.sys */
		$ = { 00500072006f0064007500630074004e0061006d0065[1-8]004d006900630072006f0073006f00660074002000570069006e0064006f007700730020004f007000650072006100740069006e0067002000530079007300740065006d } /* ProductName Microsoft Windows Operating System */
		$ = { 004f0072006900670069006e0061006c00460069006c0065006e0061006d0065[1-8]00770061006e00740064002e007300790073 } /* OriginalFilename wantd.sys */
		$ = { 004c006500670061006c0043006f0070007900720069006700680074[1-8]004d006900630072006f0073006f0066007400200043006f00720070006f0072006100740069006f006e002e00200041006c006c0020007200690067006800740073002000720065007300650072007600650064002e } /* LegalCopyright Microsoft Corporation. All rights reserved. */
	condition:
		uint16(0) == 0x5a4d and filesize < 100KB and all of them
}


rule MAL_Driver_SenseCORP__3srr {
	meta:
		description = "Detects $$$type$$$ driver mentioned in LOLDrivers project using VersionInfo values from the PE header - Sense5Ext.sys"
		author = "Florian Roth"
		reference = "https://github.com/magicsword-io/LOLDrivers"
		hash = "7f4555a940ce1156c9bcea9a2a0b801f9a5e44ec9400b61b14a7b1a6404ffdf6"
		date = "2023-06-08"
		score = 85
	strings:
		$ = { 00460069006c0065004400650073006300720069007000740069006f006e[1-8]00530065006e0073006500350020004400720069007600650072 } /* FileDescription Sense5 Driver */
		$ = { 0043006f006d00700061006e0079004e0061006d0065[1-8]00530065006e00730065003500200043004f00520050 } /* CompanyName Sense5 CORP */
		$ = { 00460069006c006500560065007200730069006f006e[1-8]0032002e0036002e0030002e0030 } /* FileVersion 2.6.0.0 */
		$ = { 00500072006f006400750063007400560065007200730069006f006e[1-8]0032002e0036002e0030002e0030 } /* ProductVersion 2.6.0.0 */
		$ = { 004c006500670061006c0043006f0070007900720069006700680074[1-8]0043006f0070007900720069006700680074002000280043002900200032003000320032 } /* LegalCopyright Copyright (C) 2022 */
	condition:
		uint16(0) == 0x5a4d and filesize < 4500KB and all of them
}


rule MAL_Driver_MicrosoftCorporation_ndislansys_MicrosoftWindowsOperatingSystem_97pe {
	meta:
		description = "Detects $$$type$$$ driver mentioned in LOLDrivers project using VersionInfo values from the PE header - ndislan.sys"
		author = "Florian Roth"
		reference = "https://github.com/magicsword-io/LOLDrivers"
		hash = "b0eb4d999e4e0e7c2e33ff081e847c87b49940eb24a9e0794c6aa9516832c427"
		date = "2023-06-08"
		score = 85
	strings:
		$ = { 00460069006c0065004400650073006300720069007000740069006f006e[1-8]004d00530020004c0041004e0020004400720069007600650072 } /* FileDescription MS LAN Driver */
		$ = { 0043006f006d00700061006e0079004e0061006d0065[1-8]004d006900630072006f0073006f0066007400200043006f00720070006f0072006100740069006f006e } /* CompanyName Microsoft Corporation */
		$ = { 00460069006c006500560065007200730069006f006e[1-8]0036002e0031002e0037003600300030002e0031003400320031 } /* FileVersion 6.1.7600.1421 */
		$ = { 00500072006f006400750063007400560065007200730069006f006e[1-8]0036002e0031002e0037003600300030002e0031003400320031 } /* ProductVersion 6.1.7600.1421 */
		$ = { 0049006e007400650072006e0061006c004e0061006d0065[1-8]006e006400690073006c0061006e002e007300790073 } /* InternalName ndislan.sys */
		$ = { 00500072006f0064007500630074004e0061006d0065[1-8]004d006900630072006f0073006f0066007400ae002000570069006e0064006f0077007300ae0020004f007000650072006100740069006e0067002000530079007300740065006d } /* ProductName Microsoft® Windows® Operating System */
		$ = { 004f0072006900670069006e0061006c00460069006c0065006e0061006d0065[1-8]006e006400690073006c0061006e002e007300790073 } /* OriginalFilename ndislan.sys */
		$ = { 004c006500670061006c0043006f0070007900720069006700680074[1-8]00a90020004d006900630072006f0073006f0066007400200043006f00720070006f0072006100740069006f006e002e00200041006c006c0020007200690067006800740073002000720065007300650072007600650064002e } /* LegalCopyright © Microsoft Corporation. All rights reserved. */
	condition:
		uint16(0) == 0x5a4d and filesize < 300KB and all of them
}
