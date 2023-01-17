 ////////////////////////////////////////////////
// Unit      : IP2Location.pas                  //
// Version   : 8.1.0                            //
// Date      : June 2021                        //
// Translator: IP2Location                      //
// Email     : support@ip2location.com          //
// License   : MIT                              //
 ////////////////////////////////////////////////

unit IP2Location;

interface

uses Windows,SysUtils,IP2Loc_DBInterface;

const
 API_VERSION			= '8.1.0';
 MAX_IPV4_RANGE			= 4294967295;
 MAX_IPV6_RANGE			= '340282366920938463463374607431768211455';
 IPV4					= 0;
 IPV6					= 1;
 _COUNTRYSHORT			= $000001;
 _COUNTRYLONG			= $000002;
 _REGION 				= $000004;
 _CITY					= $000008;
 _ISP					= $000010;
 _LATITUDE 				= $000020;
 _LONGITUDE				= $000040;
 _DOMAIN 				= $000080;
 _ZIPCODE				= $000100;
 _TIMEZONE				= $000200;
 _NETSPEED				= $000400;
 _IDDCODE				= $000800;
 _AREACODE				= $001000;
 _WEATHERSTATIONCODE	= $002000;
 _WEATHERSTATIONNAME	= $004000;
 _MCC					= $008000;
 _MNC					= $010000;
 _MOBILEBRAND			= $020000;
 _ELEVATION				= $040000;
 _USAGETYPE				= $080000;
 _ADDRESSTYPE			= $100000;
 _CATEGORY				= $200000;
 _ALL					= _COUNTRYSHORT			or
						 _COUNTRYLONG			or
						 _REGION				or
						 _CITY					or
						 _ISP					or
						 _LATITUDE				or
						 _LONGITUDE				or
						 _DOMAIN				or
						 _ZIPCODE				or
						 _TIMEZONE				or
						 _NETSPEED				or
						 _IDDCODE				or
						 _AREACODE				or
						 _WEATHERSTATIONCODE	or
						 _WEATHERSTATIONNAME	or
						 _MCC					or
						 _MNC					or
						 _MOBILEBRAND			or
						 _ELEVATION				or
						 _USAGETYPE				or
						 _ADDRESSTYPE			or
						 _CATEGORY;
 DEFAULT					= $0001;
 NO_EMPTY_STRING			= $0002;
 NO_LEADING					= $0004;
 NO_TRAILING				= $0008;
 INVALID_IPV6_ADDRESS		= 'INVALID IPV6 ADDRESS';
 INVALID_IPV4_ADDRESS		= 'INVALID IPV4 ADDRESS';
 NOT_SUPPORTED				= 'This parameter is unavailable for selected data file. Please upgrade the data file.';
 INVALID_BIN_DATABASE		= 'Incorrect IP2Location BIN file format. Please make sure that you are using the latest IP2Location BIN file.';
 IPV6_ADDRESS_IN_IPV4_BIN	= 'IPV6 ADDRESS MISSING IN IPV4 BIN';

type
  PIP2Location = ^TIP2LOCATION;
  _IP2Location  = record
	filehandle:integer;
	databasetype:byte;
	databasecolumn:byte;
	databaseyear:byte;
	databasemonth:byte;
	databaseday:byte;
	databasecount:DWORD;
	databaseaddr:DWORD;
	ipv4databasecount:DWORD;
	ipv4databaseaddr:DWORD;
	ipv6databasecount:DWORD;
	ipv6databaseaddr:DWORD;
	ipv4indexbaseaddr:DWORD;
	ipv6indexbaseaddr:DWORD;
	productcode:byte;
	licensecode:byte;
	databasesize:DWORD;
  end;
  TIP2Location = _IP2Location;


  PIP2LocationRecord = ^TIP2LocationRecord;
  _IP2LocationRecord  = record
	country_short:PChar;
	country_long:PChar;
	region:PChar;
	city:PChar;
	isp:PChar;
	latitude:Single;
	longitude:Single;
	domain:PChar;
	zipcode:PChar;
	timezone:PChar;
	netspeed:PChar;
	iddcode:PChar;
	areacode:PChar;
	weatherstationcode:PChar;
	weatherstationname:PChar;
	mcc:PChar;
	mnc:PChar;
	mobilebrand:PChar;
	elevation:Single;
	usagetype:PChar;
	addresstype:PChar;
	category:PChar;
  end;
  TIP2LocationRecord = _IP2LocationRecord;


function  IP2Location_open(db:PChar):TIP2Location;
function  IP2Location_open_mem(loc:TIP2Location;mtype:TIP2Location_mem_type):integer;
function  IP2Location_close(loc:TIP2Location):DWORD;
function  IP2Location_get_last_error_message():STRING;
function  IP2Location_get_country_short(loc:TIP2Location;ip:PChar):TIP2LocationRecord;
function  IP2Location_get_country_long(loc:TIP2Location;ip:PChar):TIP2LocationRecord;
function  IP2Location_get_country_region(loc:TIP2Location;ip:PChar):TIP2LocationRecord;
function  IP2Location_get_country_city(loc:TIP2Location;ip:PChar):TIP2LocationRecord;
function  IP2Location_get_country_isp(loc:TIP2Location;ip:PChar):TIP2LocationRecord;
function  IP2Location_get_country_latitude(loc:TIP2Location;ip:PChar):TIP2LocationRecord;
function  IP2Location_get_country_longitude(loc:TIP2Location;ip:PChar):TIP2LocationRecord;
function  IP2Location_get_country_domain(loc:TIP2Location;ip:PChar):TIP2LocationRecord;
function  IP2Location_get_country_zipcode(loc:TIP2Location;ip:PChar):TIP2LocationRecord;
function  IP2Location_get_country_timezone(loc:TIP2Location;ip:PChar):TIP2LocationRecord;
function  IP2Location_get_country_netspeed(loc:TIP2Location;ip:PChar):TIP2LocationRecord;
function  IP2Location_get_country_iddcode(loc:TIP2Location;ip:PChar):TIP2LocationRecord;
function  IP2Location_get_country_areacode(loc:TIP2Location;ip:PChar):TIP2LocationRecord;
function  IP2Location_get_country_weatherstationcode(loc:TIP2Location;ip:PChar):TIP2LocationRecord;
function  IP2Location_get_country_weatherstationname(loc:TIP2Location;ip:PChar):TIP2LocationRecord;
function  IP2Location_get_country_mcc(loc:TIP2Location;ip:PChar):TIP2LocationRecord;
function  IP2Location_get_country_mnc(loc:TIP2Location;ip:PChar):TIP2LocationRecord;
function  IP2Location_get_country_mobilebrand(loc:TIP2Location;ip:PChar):TIP2LocationRecord;
function  IP2Location_get_country_elevation(loc:TIP2Location;ip:PChar):TIP2LocationRecord;
function  IP2Location_get_country_usagetype(loc:TIP2Location;ip:PChar):TIP2LocationRecord;
function  IP2Location_get_country_addresstype(loc:TIP2Location;ip:PChar):TIP2LocationRecord;
function  IP2Location_get_country_category(loc:TIP2Location;ip:PChar):TIP2LocationRecord;
function  IP2Location_get_country_all(loc:TIP2Location;ip:PChar):TIP2LocationRecord;

implementation

uses WinSock,Classes,Math;

const

 COUNTRY_POSITION			:array [0..25] of byte   =(0,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2);
 REGION_POSITION			:array [0..25] of byte   =(0,0,0,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3);
 CITY_POSITION				:array [0..25] of byte   =(0,0,0,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4);
 LATITUDE_POSITION			:array [0..25] of byte   =(0,0,0,0,0,5,5,0,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5);
 LONGITUDE_POSITION			:array [0..25] of byte   =(0,0,0,0,0,6,6,0,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6);
 ZIPCODE_POSITION			:array [0..25] of byte   =(0,0,0,0,0,0,0,0,0,7,7,7,7,0,7,7,7,0,7,0,7,7,7,0,7,7);
 TIMEZONE_POSITION			:array [0..25] of byte   =(0,0,0,0,0,0,0,0,0,0,0,8,8,7,8,8,8,7,8,0,8,8,8,0,8,8);
 ISP_POSITION				:array [0..25] of byte   =(0,0,3,0,5,0,7,5,7,0,8,0,9,0,9,0,9,0,9,7,9,0,9,7,9,9);
 DOMAIN_POSITION			:array [0..25] of byte   =(0,0,0,0,0,0,0,6,8,0,9,0,10,0,10,0,10,0,10,8,10,0,10,8,10,10);
 NETSPEED_POSITION			:array [0..25] of byte   =(0,0,0,0,0,0,0,0,0,0,0,0,0,8,11,0,11,8,11,0,11,0,11,0,11,11);
 IDDCODE_POSITION			:array [0..25] of byte   =(0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,9,12,0,12,0,12,9,12,0,12,12);
 AREACODE_POSITION			:array [0..25] of byte   =(0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,10 ,13 ,0,13,0,13,10,13,0,13,13);
 WEATHERSTATIONCODE_POSITION:array [0..25] of byte   =(0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,9,14,0,14,0,14,0,14,14);
 WEATHERSTATIONNAME_POSITION:array [0..25] of byte   =(0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,10,15,0,15,0,15,0,15,15);
 MCC_POSITION				:array [0..25] of byte   =(0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,9,16,0,16,9,16,16);
 MNC_POSITION				:array [0..25] of byte   =(0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,10,17,0,17,10,17,17);
 MOBILEBRAND_POSITION		:array [0..25] of byte   =(0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,11,18,0,18,11,18,18);
 ELEVATION_POSITION			:array [0..25] of byte   =(0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,11,19,0,19,19);
 USAGETYPE_POSITION			:array [0..25] of byte   =(0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,12,20,20);
 ADDRESSTYPE_POSITION		:array [0..25] of byte   =(0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,21);
 CATEGORY_POSITION			:array [0..25] of byte   =(0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,22);

 AF_INET6 = 23;


 type
 ipv_t = record
 ipversion:Integer;
 ipv4:cardinal;
 ipv6:Tin6_addr_local;
 ipv6_t:Tin6_addr_local;
 ipno_t:cardinal;
 end;


 var
 openMemFlag:Boolean = False;
 lastErrMsg:String = '';


 function IP2Location_get_record(loc:TIP2Location;ipstring:PChar;mode:Cardinal):TIP2LocationRecord;forward;
 function IP2Location_get_ipv6_record (loc:TIP2Location;ipstring:PChar;mode:Cardinal):TIP2LocationRecord;forward;
 function read_record(loc:TIP2Location;rowaddr,mode:cardinal):TIP2LocationRecord;forward;
 function IP2Location_initialize(var loc:TIP2Location):integer;forward;
 function ipv6_compare(addr1,addr2:Tin6_addr_local):integer;forward;
 procedure IP2Location_delete_shm;forward;
 function IP2Location_ip_is_ipv4(ipaddr:PChar):integer;forward;
 function IP2Location_ip_is_ipv6(ipaddr:PChar):integer;forward;
 function IP2Location_ip2no(ipstring:PChar):Cardinal;forward;
 function parse_addr(addr:PChar;loc:TIP2Location):ipv_t;forward;
 function bad_record(const aMessage:PChar):TIP2LocationRecord;forward;
{$IFDEF UNICODE}
 function InetPton(Family:integer;pszAddrString:pchar;var pAddrBuf ):integer;stdcall;external 'ws2_32.dll' name 'InetPtonW';
{$ELSE}
 function InetPton(Family:integer;pszAddrString:pchar;var pAddrBuf ):integer;stdcall;external 'ws2_32.dll' name 'inet_pton';
{$ENDIF}

// Descrption:initializes the record with the appropriate value from the database.
function IP2Location_initialize(var loc:TIP2Location):integer;
begin
	loc.databasetype      := IP2Location_read8(loc.filehandle,1);
	loc.databasecolumn    := IP2Location_read8(loc.filehandle,2);
	loc.databaseyear      := IP2Location_read8(loc.filehandle,3);
	loc.databasemonth     := IP2Location_read8(loc.filehandle,4);
	loc.databaseday       := IP2Location_read8(loc.filehandle,5);
	loc.databasecount     := IP2Location_read32(loc.filehandle,6);
	loc.databaseaddr      := IP2Location_read32(loc.filehandle,10);
	loc.ipv4databasecount := IP2Location_read32(loc.filehandle, 6);
	loc.ipv4databaseaddr  := IP2Location_read32(loc.filehandle, 10);
	loc.ipv6databasecount := IP2Location_read32(loc.filehandle, 14);
	loc.ipv6databaseaddr  := IP2Location_read32(loc.filehandle, 18);
	loc.ipv4indexbaseaddr := IP2Location_read32(loc.filehandle, 22);
	loc.ipv6indexbaseaddr := IP2Location_read32(loc.filehandle, 26);
	loc.productcode       := IP2Location_read32(loc.filehandle, 30);
	loc.licensecode       := IP2Location_read32(loc.filehandle, 31);
	loc.databasesize      := IP2Location_read32(loc.filehandle, 32);
	result:=0;
end;

// Description: Delete IP2Location shared memory if it is present.
procedure IP2Location_delete_shm;
begin
IP2Location_DB_del_shm();
end;

function ipv6_compare(addr1,addr2:Tin6_addr_local):integer;
var i:integer;
begin
result:=0;
i:=0;
while (i<16) and (result=0) do
begin
	if addr1.addr8[i] > addr2.addr8[i] then result:=1
	else
		if addr1.addr8[i] < addr2.addr8[i] then result:=-1;
		inc(i);
end;
end;


function IP2Location_ip_is_ipv4(ipaddr:PChar):integer;
var IA:IN_ADDR;
begin
result:=InetPton(AF_INET, ipaddr,IA);
end;

function IP2Location_ip_is_ipv6(ipaddr:PChar):integer;
var IA:Tin6_addr_local;
begin
result:=InetPton(AF_INET6, ipaddr,IA);
end;

function IP2Location_ip2no(ipstring:PChar):Cardinal;
 var P_Out:PAnsiChar;
     aResult:integer;
begin
Result:=0;
{$IFDEF UNICODE}
 P_Out:=AllocMem(StrLen(ipstring)+1);
 WideCharToMultiByte(CP_UTF8,0,ipstring,StrLen(ipstring),P_Out,StrLen(ipstring),nil,nil);
 aResult:=inet_addr(P_Out);
{$ELSE}
 aResult:=inet_addr(ipstring);
{$ENDIF}
 if (ipstring <>nil)  then
 Result:=(LoByte(LoWord(aResult))shl 24) or (HiByte(LoWord(aResult))shl 16) or (LoByte(HiWord(aResult))shl 8) or HiByte(HiWord(aResult))  ;
end;

function parse_addr(addr:PChar;loc:TIP2Location):ipv_t;
begin
if IP2Location_ip_is_ipv4(addr)=1 then
	begin
	result.ipversion := 4;
	result.ipv4 := IP2Location_ip2no(addr);
	end
else if IP2Location_ip_is_ipv6(addr)=1 then
	begin
	if (strlen(addr)>7) and (addr[0]=':') and (addr[1] = ':') and
	((addr[2]='F') or (addr[2]='f')) and
	((addr[3]='F') or (addr[3]='f')) and
	((addr[4]='F') or (addr[4]='f')) and
	((addr[5]='F') or (addr[5]='f')) and
	(addr[6]=':') and (IP2Location_ip_is_ipv4(addr+7)=1) then
		{ reformat ipv4 address in ipv6 }
		begin
		result.ipversion := 4;
		result.ipv4 := IP2Location_ip2no(addr + 7);
		end
	else if (strlen(addr)>7) and (addr[0]=':') and (addr[1] = ':') and
	((addr[2]='F') or (addr[2]='f')) and
	((addr[3]='F') or (addr[3]='f')) and
	((addr[4]='F') or (addr[4]='f')) and
	((addr[5]='F') or (addr[5]='f')) and
	(addr[6]=':') and 
	not(((addr[7]='F') or (addr[7]='f')) and
		((addr[8]='F') or (addr[8]='f')) and
		((addr[9]='F') or (addr[9]='f')) and
		((addr[10]='F') or (addr[10]='f'))) then
		{ reformat ipv4 address in ipv6 }
		begin
		InetPton(AF_INET6,addr,result.ipv6);
		result.ipversion := 4;
		result.ipv4 := (((result.ipv6.addr8[12]*256) + result.ipv6.addr8[13])*65536) + ((result.ipv6.addr8[14]*256) + result.ipv6.addr8[15]);
		end
	else if (strlen(addr)>5) and (addr[0]='2') and (addr[1] = '0') and (addr[2]='0') and (addr[3]='2') and (addr[4]=':') then
		{ reformat 6to4 address to ipv4 address 2002:: to 2002:FFFF:FFFF:FFFF:FFFF:FFFF:FFFF:FFFF }
		begin
		InetPton(AF_INET6,addr,result.ipv6);
		addr := PChar(IntToStr(result.ipv6.addr8[2]) + '.' + IntToStr(result.ipv6.addr8[3]) + '.' + IntToStr(result.ipv6.addr8[4]) + '.' + IntToStr(result.ipv6.addr8[5]));
		result.ipversion := 4;
		result.ipv4 := IP2Location_ip2no(addr);
		end
	else if (strlen(addr)>5) and (addr[0]='2') and (addr[1] = '0') and (addr[2]='0') and (addr[3]='1') and (addr[4]=':') and ((addr[5]='0') or (addr[5]=':')) then
		{ reformat Teredo address to ipv4 address 2001:0000:: to 2001:0000:FFFF:FFFF:FFFF:FFFF:FFFF:FFFF: }
		begin
		InetPton(AF_INET6,addr,result.ipv6);
		addr := PChar(IntToStr(-(result.ipv6.addr8[12]-255)) + '.' + IntToStr(-(result.ipv6.addr8[13]-255)) + '.' + IntToStr(-(result.ipv6.addr8[14]-255)) + '.' + IntToStr(-(result.ipv6.addr8[15]-255)));
		result.ipversion := 4;
		result.ipv4 := IP2Location_ip2no(addr);
		end
	else if loc.ipv6databasecount = 0 then
		result.ipversion := 0
	else
		begin
		result.ipversion := 6;
		InetPton(AF_INET6,addr,result.ipv6);
		end
	end
else
result.ipversion:=-1;
end;

function bad_record(const aMessage:PChar):TIP2LocationRecord;
begin
result.country_short:=aMessage;
result.country_long:=aMessage;
result.region:=aMessage;
result.city:=aMessage;
result.isp:=aMessage;
result.latitude:= 0;
result.longitude:= 0;
result.domain:=aMessage;
result.zipcode:=aMessage;
result.timezone:=aMessage;
result.netspeed:=aMessage;
result.iddcode:=aMessage;
result.areacode:=aMessage;
result.weatherstationcode:=aMessage;
result.weatherstationname:=aMessage;
result.mcc:=aMessage;
result.mnc:=aMessage;
result.mobilebrand:=aMessage;
result.elevation := 0;
result.usagetype:=aMessage;
result.addresstype:=aMessage;
result.category:=aMessage;
end;

function IP2Location_get_record(loc:TIP2Location;ipstring:PChar;mode:Cardinal):TIP2LocationRecord;
var
handle:integer;
baseaddr,dbcolumn,low,high,mid,ipno,ipfrom,ipto,ipv4Indexbaseaddr,ipnum1_2,indexpos:Cardinal;
parsed_ipv:ipv_t;
begin
handle := loc.filehandle;
baseaddr := loc.ipv4databaseaddr;
dbcolumn := loc.databasecolumn;
ipv4Indexbaseaddr := loc.ipv4indexbaseaddr;
low := 0;
high := loc.ipv4databasecount;
mid := 0;
parsed_ipv := parse_addr(ipstring, loc);

if parsed_ipv.ipversion = 6 then
	begin
	result:=IP2Location_get_ipv6_record(loc, ipstring, mode);
	exit;
	end;

if parsed_ipv.ipversion = 0 then
	begin
	result:=bad_record(IPV6_ADDRESS_IN_IPV4_BIN);
	exit;
	end;

if parsed_ipv.ipversion <> 4 then
	begin
	result:=bad_record(INVALID_IPV4_ADDRESS);
	exit;
	end;

ipno := parsed_ipv.ipv4;
if (ipv4Indexbaseaddr > 0) then
	begin
	ipnum1_2 := ipno shr 16;
	indexpos := ipv4IndexbaseAddr + (ipnum1_2 shl 3);
	if (ipno = MAX_IPV4_RANGE) then
		ipno := ipno - 1;
		low := IP2Location_read32(handle, indexpos);
		high := IP2Location_read32(handle, indexpos + 4);
	end;

	while (low <= high) do
	begin
	mid:=(low + high)div 2;
	ipfrom:= IP2Location_read32(handle, baseaddr + mid * dbcolumn * 4);
	ipto:= IP2Location_read32(handle, baseaddr + (mid + 1) * dbcolumn * 4);
	if (ipno >= ipfrom) and (ipno < ipto) then
		begin
		result:=read_record(loc, baseaddr + (mid * dbcolumn * 4), mode);
		exit;
		end
	else
		begin
		if ipno < ipfrom then
			high := mid - 1
		else
			low := mid + 1;
		end;
	end;
end;

function IP2Location_get_ipv6_record (loc:TIP2Location; ipstring:PChar;mode:Cardinal):TIP2LocationRecord;
var
handle:integer;
baseaddr,dbcolumn,low,high,mid,ipv6Indexbaseaddr,ipnum1,indexpos:cardinal;
ipno,ipfrom,ipto:Tin6_addr_local;
parsed_ipv:ipv_t;
begin
handle := loc.filehandle;
baseaddr := loc.ipv6databaseaddr;
dbcolumn := loc.databasecolumn;
ipv6Indexbaseaddr := loc.ipv6indexbaseaddr;
low  := 0;
high := loc.ipv6databasecount;
mid  := 0;
parsed_ipv:= parse_addr(ipstring, loc);

if parsed_ipv.ipversion = 4 then
	begin
	result:=IP2Location_get_record(loc, ipstring, mode);
	exit;
	end;

if parsed_ipv.ipversion <> 6 then
	begin
	result:=bad_record(INVALID_IPV6_ADDRESS);
	exit;
	end;

ipno := parsed_ipv.ipv6;
if (ipno.addr8[0] = 255) and (ipno.addr8[1] = 255) and (ipno.addr8[2] = 255) and (ipno.addr8[3] = 255) and 
(ipno.addr8[4] = 255)and (ipno.addr8[5] = 255) and (ipno.addr8[6] = 255) and  (ipno.addr8[7] = 255) and 
(ipno.addr8[8] = 255)and (ipno.addr8[9] = 255) and (ipno.addr8[10] = 255) and  (ipno.addr8[11] = 255) and 
(ipno.addr8[12] = 255)and (ipno.addr8[13] = 255) and (ipno.addr8[14] = 255) and  (ipno.addr8[15] = 255) then
	ipno.addr8[15] := 254;
if (ipv6Indexbaseaddr > 0) then
	begin
	ipnum1 := (ipno.addr8[0] * 256) + ipno.addr8[1];
	indexpos := ipv6Indexbaseaddr + (ipnum1 shl 3);
	low := IP2Location_read32(handle, indexpos);
	high := IP2Location_read32(handle, indexpos + 4);
	end;

	while (low <= high) do
	begin
	mid :=(low + high) div 2;
	ipfrom := IP2Location_readIPv6Address(handle, baseaddr + mid * (dbcolumn * 4 + 12));
	ipto := IP2Location_readIPv6Address(handle, baseaddr + ( mid + 1 ) * (dbcolumn * 4 + 12));

	if (ipv6_compare(ipno, ipfrom) >= 0) and  (ipv6_compare(ipno, ipto) < 0) then
		begin
		result:=read_record(loc, baseaddr + mid * (dbcolumn * 4 + 12) + 12, mode);
		exit;
		end
	else
		begin
		if  ipv6_compare(ipno, ipfrom) < 0 then
			high := mid - 1
		else
			low := mid + 1;
		end;
	end;
end;

function read_record(loc:TIP2Location;rowaddr,mode:cardinal):TIP2LocationRecord;
var
dbtype:Byte;
handle:integer;
begin
dbtype := loc.databasetype;
handle := loc.filehandle;
if ((mode and _COUNTRYSHORT>0) and (COUNTRY_POSITION[dbtype] <> 0)) then
	result.country_short := IP2Location_readStr(handle, IP2Location_read32(handle, rowaddr + 4 * (COUNTRY_POSITION[dbtype]-1)))
else
	result.country_short := NOT_SUPPORTED;


if ((mode and _COUNTRYLONG>0) and (COUNTRY_POSITION[dbtype] <> 0)) then
	result.country_long := IP2Location_readStr(handle, IP2Location_read32(handle, rowaddr + 4 * (COUNTRY_POSITION[dbtype]-1))+3)
else
	result.country_long := NOT_SUPPORTED;


if ((mode and _REGION>0) and (REGION_POSITION[dbtype] <> 0)) then
	result.region := IP2Location_readStr(handle, IP2Location_read32(handle, rowaddr + 4 * (REGION_POSITION[dbtype]-1)))
else
	result.region := NOT_SUPPORTED;


if ((mode and _CITY>0) and (CITY_POSITION[dbtype] <> 0)) then
	result.city := IP2Location_readStr(handle, IP2Location_read32(handle, rowaddr + 4 * (CITY_POSITION[dbtype]-1)))
else
	result.city := NOT_SUPPORTED;


if ((mode and _ISP>0) and (ISP_POSITION[dbtype] <> 0)) then
	result.isp := IP2Location_readStr(handle, IP2Location_read32(handle, rowaddr + 4 * (ISP_POSITION[dbtype]-1)))
else
	result.isp := NOT_SUPPORTED;


if ((mode and _LATITUDE>0) and (LATITUDE_POSITION[dbtype] <> 0)) then
	result.latitude := IP2Location_readFloat(handle, rowaddr + 4 * (LATITUDE_POSITION[dbtype]-1))
else
	result.latitude := 0.0;


if ((mode and _LONGITUDE>0) and (LONGITUDE_POSITION[dbtype] <> 0)) then
	result.longitude := IP2Location_readFloat(handle, rowaddr + 4 * (LONGITUDE_POSITION[dbtype]-1))
else
	result.longitude := 0.0;


if ((mode and _DOMAIN>0) and (DOMAIN_POSITION[dbtype] <> 0)) then
	result.domain := IP2Location_readStr(handle, IP2Location_read32(handle, rowaddr + 4 * (DOMAIN_POSITION[dbtype]-1)))
else
	result.domain := NOT_SUPPORTED;


if ((mode and _ZIPCODE>0) and (ZIPCODE_POSITION[dbtype] <> 0)) then
	result.zipcode := IP2Location_readStr(handle, IP2Location_read32(handle, rowaddr + 4 * (ZIPCODE_POSITION[dbtype]-1)))
else
	result.zipcode := NOT_SUPPORTED;


if ((mode and _TIMEZONE>0) and (TIMEZONE_POSITION[dbtype] <> 0)) then
	result.timezone := IP2Location_readStr(handle, IP2Location_read32(handle, rowaddr + 4 * (TIMEZONE_POSITION[dbtype]-1)))
else
	result.timezone := NOT_SUPPORTED;


if ((mode and _NETSPEED>0) and (NETSPEED_POSITION[dbtype] <> 0)) then
	result.netspeed := IP2Location_readStr(handle, IP2Location_read32(handle, rowaddr + 4 * (NETSPEED_POSITION[dbtype]-1)))
else
	result.netspeed := NOT_SUPPORTED;


if ((mode and _IDDCODE>0) and (IDDCODE_POSITION[dbtype] <> 0)) then
	result.iddcode := IP2Location_readStr(handle, IP2Location_read32(handle, rowaddr + 4 * (IDDCODE_POSITION[dbtype]-1)))
else
	result.iddcode := NOT_SUPPORTED;


if ((mode and _AREACODE>0) and (AREACODE_POSITION[dbtype] <> 0)) then
	result.areacode := IP2Location_readStr(handle, IP2Location_read32(handle, rowaddr + 4 * (AREACODE_POSITION[dbtype]-1)))
else
	result.areacode := NOT_SUPPORTED;


if ((mode and _WEATHERSTATIONCODE>0) and (WEATHERSTATIONCODE_POSITION[dbtype] <> 0)) then
	result.weatherstationcode := IP2Location_readStr(handle, IP2Location_read32(handle, rowaddr + 4 * (WEATHERSTATIONCODE_POSITION[dbtype]-1)))
else
	result.weatherstationcode := NOT_SUPPORTED;


if ((mode and _WEATHERSTATIONNAME>0) and (WEATHERSTATIONNAME_POSITION[dbtype] <> 0)) then
	result.weatherstationname := IP2Location_readStr(handle, IP2Location_read32(handle, rowaddr + 4 * (WEATHERSTATIONNAME_POSITION[dbtype]-1)))
else
	result.weatherstationname := NOT_SUPPORTED;


if ((mode and _MCC>0) and (MCC_POSITION[dbtype] <> 0)) then
	result.mcc := IP2Location_readStr(handle, IP2Location_read32(handle, rowaddr + 4 * (MCC_POSITION[dbtype]-1)))
else
	result.mcc := NOT_SUPPORTED;


if ((mode and _MNC>0) and (MNC_POSITION[dbtype] <> 0)) then
	result.mnc := IP2Location_readStr(handle, IP2Location_read32(handle, rowaddr + 4 * (MNC_POSITION[dbtype]-1)))
else
	result.mnc := NOT_SUPPORTED;


if ((mode and _MOBILEBRAND>0) and (MOBILEBRAND_POSITION[dbtype] <> 0)) then
	result.mobilebrand := IP2Location_readStr(handle, IP2Location_read32(handle, rowaddr + 4 * (MOBILEBRAND_POSITION[dbtype]-1)))
else
	result.mobilebrand := NOT_SUPPORTED;


if ((mode and _ELEVATION>0) and (ELEVATION_POSITION[dbtype] <> 0)) then
	result.elevation := strtofloat(IP2Location_readStr(handle, IP2Location_read32(handle, rowaddr + 4 * (ELEVATION_POSITION[dbtype]-1))))
else
	result.elevation := 0.0;


if ((mode and _USAGETYPE>0) and (USAGETYPE_POSITION[dbtype] <> 0)) then
	result.usagetype := IP2Location_readStr(handle, IP2Location_read32(handle, rowaddr + 4 * (USAGETYPE_POSITION[dbtype]-1)))
else
	result.usagetype := NOT_SUPPORTED;


if ((mode and _ADDRESSTYPE>0) and (ADDRESSTYPE_POSITION[dbtype] <> 0)) then
	result.addresstype := IP2Location_readStr(handle, IP2Location_read32(handle, rowaddr + 4 * (ADDRESSTYPE_POSITION[dbtype]-1)))
else
	result.addresstype := NOT_SUPPORTED;


if ((mode and _CATEGORY>0) and (CATEGORY_POSITION[dbtype] <> 0)) then
	result.category := IP2Location_readStr(handle, IP2Location_read32(handle, rowaddr + 4 * (CATEGORY_POSITION[dbtype]-1)))
else
	result.category := NOT_SUPPORTED;
end;

// Description: Open the IP2Location database file
function IP2Location_open(db:PChar):TIP2Location;
var f:integer;
    loc:TIP2Location;
begin
FillChar(loc, SizeOf(TIP2Location), #0);

Result := loc;

f:=FileOpen(db,fmOpenRead);
if f <> INVALID_HANDLE_VALUE then
	begin
	loc.filehandle:=f;
	IP2Location_initialize(loc);
	if loc.productcode = 1 then
    Result := loc
	else
		if ((loc.databaseyear <= 20) and (loc.productcode = 0)) then
			begin
			IP2Location_DB_close(loc.filehandle);
			lastErrMsg:=INVALID_BIN_DATABASE;
			exit;
			end;
	end
else
	lastErrMsg := 'IP2Location_open error in opening ' + db + '.';
	exit;
end;

//Description: This function to set the DB access type.
function IP2Location_open_mem(loc:TIP2Location;mtype:TIP2Location_mem_type):integer;
begin
result:=-1;
if (loc.filehandle <>0) and not(openMemFlag) then
	begin
	openMemFlag:=True;
		case mtype of
		IP2LOCATION_FILE_IO      :result:=0;//Just return,by default its IP2LOCATION_FILE_IO
		IP2LOCATION_CACHE_MEMORY :result:=IP2Location_DB_set_memory_cache(loc.filehandle);
		IP2LOCATION_SHARED_MEMORY:result:=IP2Location_DB_set_shared_memory(loc.filehandle);
		end;
	end;
end;

// Description: Close the IP2Location database file
function IP2Location_close(loc:TIP2Location):DWORD;
begin
openMemFlag:=False;
if loc.filehandle<>0 then
	IP2Location_DB_close(loc.filehandle);
	result:=0;
end;

// Description: Get last error message
function IP2Location_get_last_error_message():STRING;
begin
result:=lastErrMsg;
end;

// Description: Get country code
function IP2Location_get_country_short(loc:TIP2Location;ip:PChar):TIP2LocationRecord;
begin
result:=IP2Location_get_record(loc, ip, _COUNTRYSHORT);
end;

// Description: Get country name
function IP2Location_get_country_long(loc:TIP2Location;ip:PChar):TIP2LocationRecord;
begin
result:=IP2Location_get_record(loc, ip, _COUNTRYLONG);
end;

// Description: Get the name of state/region
function IP2Location_get_country_region(loc:TIP2Location;ip:PChar):TIP2LocationRecord;
begin
result:=IP2Location_get_record(loc, ip, _REGION);
end;

// Description: Get city name
function IP2Location_get_country_city(loc:TIP2Location;ip:PChar):TIP2LocationRecord;
begin
result:=IP2Location_get_record(loc, ip, _CITY);
end;

// Description: Get ISP name
function IP2Location_get_country_isp(loc:TIP2Location;ip:PChar):TIP2LocationRecord;
begin
result:=IP2Location_get_record(loc, ip, _ISP);
end;

// Description: Get latitude
function IP2Location_get_country_latitude(loc:TIP2Location;ip:PChar):TIP2LocationRecord;
begin
result:=IP2Location_get_record(loc, ip, _LATITUDE);
end;

// Description: Get longitude
function IP2Location_get_country_longitude(loc:TIP2Location;ip:PChar):TIP2LocationRecord;
begin
result:=IP2Location_get_record(loc, ip, _LONGITUDE);
end;

// Description: Get domain name
function IP2Location_get_country_domain(loc:TIP2Location;ip:PChar):TIP2LocationRecord;
begin
result:=IP2Location_get_record(loc, ip, _DOMAIN);
end;

// Description: Get ZIP code
function IP2Location_get_country_zipcode(loc:TIP2Location;ip:PChar):TIP2LocationRecord;
begin
result:=IP2Location_get_record(loc, ip, _ZIPCODE);
end;

// Description: Get time zone
function IP2Location_get_country_timezone(loc:TIP2Location;ip:PChar):TIP2LocationRecord;
begin
result:=IP2Location_get_record(loc, ip, _TIMEZONE);
end;

// Description: Get net speed
function IP2Location_get_country_netspeed(loc:TIP2Location;ip:PChar):TIP2LocationRecord;
begin
result:=IP2Location_get_record(loc, ip, _NETSPEED);
end;

// Description: Get IDD code
function IP2Location_get_country_iddcode(loc:TIP2Location;ip:PChar):TIP2LocationRecord;
begin
result:=IP2Location_get_record(loc, ip, _IDDCODE);
end;

// Description: Get area code
function IP2Location_get_country_areacode(loc:TIP2Location;ip:PChar):TIP2LocationRecord;
begin
result:=IP2Location_get_record(loc,ip,_AREACODE);
end;

// Description: Get weather station code
function IP2Location_get_country_weatherstationcode(loc:TIP2Location;ip:PChar):TIP2LocationRecord;
begin
 result:=IP2Location_get_record(loc,ip,_WEATHERSTATIONCODE);
end;

// Description: Get weather station name
function IP2Location_get_country_weatherstationname(loc:TIP2Location;ip:PChar):TIP2LocationRecord;
begin
result:=IP2Location_get_record(loc,ip,_WEATHERSTATIONNAME);
end;

// Description: Get mobile country code
function IP2Location_get_country_mcc(loc:TIP2Location;ip:PChar):TIP2LocationRecord;
begin
result:=IP2Location_get_record(loc,ip,_MCC);
end;

// Description: Get mobile national code
function IP2Location_get_country_mnc(loc:TIP2Location;ip:PChar):TIP2LocationRecord;
begin
result:=IP2Location_get_record(loc,ip,_MNC);
end;

// Description: Get mobile carrier brand
function IP2Location_get_country_mobilebrand(loc:TIP2Location;ip:PChar):TIP2LocationRecord;
begin
result:=IP2Location_get_record(loc,ip,_MOBILEBRAND);
end;

// Description: Get elevation
function IP2Location_get_country_elevation(loc:TIP2Location;ip:PChar):TIP2LocationRecord;
begin
result:=IP2Location_get_record(loc,ip,_ELEVATION);
end;

// Description: Get usage type
function IP2Location_get_country_usagetype(loc:TIP2Location;ip:PChar):TIP2LocationRecord;
begin
result:=IP2Location_get_record(loc,ip,_USAGETYPE);
end;

// Description: Get address type
function IP2Location_get_country_addresstype(loc:TIP2Location;ip:PChar):TIP2LocationRecord;
begin
result:=IP2Location_get_record(loc,ip,_ADDRESSTYPE);
end;

// Description: Get category
function IP2Location_get_country_category(loc:TIP2Location;ip:PChar):TIP2LocationRecord;
begin
result:=IP2Location_get_record(loc,ip,_CATEGORY);
end;

// Description: Get all records
function IP2Location_get_country_all(loc:TIP2Location;ip:PChar):TIP2LocationRecord;
begin
result:=IP2Location_get_record(loc,ip,_ALL);
end;


end.

