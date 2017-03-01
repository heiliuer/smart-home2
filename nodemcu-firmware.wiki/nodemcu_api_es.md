# NodeMCU API Instrucciones

## version 0.1.0 build 2015-10-09

### Descripción 

Esta sección esta dedicada a la traducción de las instrucciones que utiliza el módulo NodeMCU para trabajar bajo programacion LUA.

##  Indice
* Change Log
* Nuevo Mapa GPIO
* Antiguo mapa GPIO

##Modulo node
###Instrucciones que tienen efecto en el dispositivo:

* node.restart()
* node.dsleep()
* node.info()
* node.chipid()
* node.flashid()
* node.heap()
* node.key() --Obsoleta
* node.led() --Obsoleta
* node.input()
* node.output()
* node.readvdd33() --obsoleta, movida a adc.readvdd33()
* node.compile()
* node.setcpufreq()
* node.restore() --aggregada en 07/04/2015

##Módulo de archivos
###Instrucciones para el uso de archivos dentro del almacenamiento del chip.

* file.remove()
* file.open()
* file.close()
* file.readline()
* file.writeline()
* file.read()
* file.write()
* file.flush()
* file.seek()
* file.list()
* file.format()
* file.rename()
* file.fsinfo()

##Módulo wifi
###Instrucciones para el uso de la conexión wifi.

* wifi.setmode()
* wifi.getmode()
* wifi.getchannel() --agregado en 06/16/2015
* wifi.setphymode() --agregado en 06/16/2015
* wifi.getphymode() --agregado en 06/16/2015
* wifi.startsmart()
* wifi.stopsmart()
* wifi.sleeptype()

##sub módulo wifi.sta 
###Instrucciones cuando la conexión wifi esta en modo estación o cliente.

* wifi.sta.getconfig() --agregado en 06/16/2015
* wifi.sta.config() --actualizado en 06/16/2015
* wifi.sta.connect()
* wifi.sta.disconnect()
* wifi.sta.autoconnect()
* wifi.sta.getip()
* wifi.sta.setip()
* wifi.sta.getmac() --actualizado en 06/16/2015
* wifi.sta.setmac() --actualizado en 06/16/2015
* wifi.sta.getap() --actualizado en 06/16/2015
* wifi.sta.status()
* wifi.sta.getbroadcast()
* wifi.sta.eventMonReg() --agregado en 07/14/2015
* wifi.sta.eventMonStart() --agregado en 07/14/2015
* wifi.sta.eventMonStop() --agregado en 07/14/2015
 
##sub módulo wifi.ap
###Instrucciones cuando la conexión wifi esta en modo punto de acceso (access point)

* wifi.ap.config()
* wifi.ap.getip()
* wifi.ap.setip()
* wifi.ap.getmac()
* wifi.ap.setmac() --Actualizado en 06/16/2015
* wifi.ap.getclient()
* wifi.ap.getconfig()
* wifi.ap.getbroadcast()
 
## sub módulo wifi.ap.dhcp  

* wifi.ap.dhcp.config()
* wifi.ap.dhcp.start()
* wifi.ap.dhcp.stop()

##módulo timer
### instrucciones para controlar tiempos.
* tmr.delay()
* tmr.now()
* tmr.alarm()
* tmr.stop()
* tmr.wdclr()
* tmr.time()

##módulo gpio 
###Instrucciones para el uso de los pines de entrada y salida (GPIO)
* gpio.mode()
* gpio.read()
* gpio.write()
* gpio.trig()

##pwm module
###instrucciones para el uso de pwm.
* pwm.setup()
* pwm.close()
* pwm.start()
* pwm.stop()
* pwm.setclock()
* pwm.getclock()
* pwm.setduty()
* pwm.getduty()

##Módulo net 
###instrucciones para el uso de redes.
* net.createServer()
* net.createConnection()

## Sub módulo net.server 
###instrucciones para el uso del servidor.

* net.server:listen()
* net.server:close()

## sub modulo net.socket 
###instrucciones para el uso de sockets.
* net.socket:connect()
* net.socket:send()
* net.socket:on()
* net.socket:close()
* net.socket:dns()

##sub módulo net.dns 
### instrucciones para el uso o configuración de dns.
* net.dns:setdnsserver()
* net.dns:getdnsserver()
* net.dns:resolve()

## módulo i2c 
###instrucciones para el uso de dispositivos iic o i2c
* i2c.setup()
* i2c.start()
* i2c.stop()
* i2c.address()
* i2c.write()
* i2c.read()

##módulo adc 
##instrucciones para el uso de conversores analogico-digital adc
* adc.read()
* adc.readvdd33()

##módulo uart 
### instrucciones para el uso y configuracion de comunicacion uart
* uart.setup()
* uart.on()
* uart.write()

## módulo 1-wire 
### instrucciones para el uso y configuracion de comunicacion 1 linea.
* ow.setup()
* ow.reset()
* ow.skip()
* ow.select()
* ow.write()
* ow.write_bytes()
* ow.read()
* ow.read_bytes()
* ow.depower()
* ow.reset_search()
* ow.target_search()
* ow.search()
* ow.crc8()
* ow.check_crc16()
* ow.crc16()

##módulo bit 

* bit.bnot()
* bit.band()
* bit.bor()
* bit.bxor()
* bit.lshift()
* bit.rshift()
* bit.arshift()
* bit.bit()
* bit.set()
* bit.clear()
* bit.isset()
* bit.isclear()
 
##módulo spi 
###instrucciones para el uso o configuracion de dispositivos y comunicación SPI
* spi.setup()
* spi.send()
* spi.recv()
* spi.set_mosi()
* spi.get_miso()
* spi.transaction()

##módulo mqtt 
###instrucciones para el uso de protocolo mqtt

* mqtt.Client()

##sub módulo mqtt.client
### instrucciones para el uso de mqtt
* mqtt.client:lwt()
* mqtt.client:connect()
* mqtt.client:close()
* mqtt.client:publish()
* mqtt.client:subscribe()
* mqtt.client:on()

##módulo WS2801 
### instrucciones para el uso de la tira de leds ws2801
* ws2801.init()
* ws2801.write()

##módulo WS2812 module
### instrucciones para el uso de la tira de leds ws2812
* ws2812.writergb()

##cjson module
###instrucciones para el uso de Json.
* cjson.encode()
* cjson.decode()

##crypto module
### instrucciones para el uso de criptologia.
* crypto.hash()
* crypto.hmac()
* crypto.mask()
* crypto.toHex()
* crypto.toBase64()

## Módulo u8g 
###instrucciones para el uso de la libreria u8g
##controladores de pantallas I2C 
### instrucciones para los controladores de pantallas IIC o I2C
* u8g.sh1106_128x64_i2c() -- Solo en el branch dev
* u8g.ssd1306_128x64_i2c()
* u8g.ssd1306_64x48_i2c() -- Solo en el branch dev
* u8g.ssd1309_128x64_i2c() -- Solo en el branch dev
* u8g.ssd1327_96x96_gr_i2c() -- Solo en el branch dev
* u8g.uc1611_dogm240_i2c() -- Solo en el branch dev
* u8g.uc1611_dogxl240_i2c() --Solo en el branch dev

##Controladores para pantallas SPI
### instrucciones para los controladores de pantallas SPI
* u8g.ld7032_60x32_hw_spi() -- Solo en el branch dev
* u8g.pcd8544_84x48_hw_spi() -- Solo en el branch dev
* u8g.pcf8812_96x65_hw_spi() -- Solo en el branch dev
* u8g.sh1106_128x64_hw_spi() -- Cambio en e API branch dev 
* u8g.ssd1306_128x64_hw_spi() -- Solo en el branch dev
* u8g.ssd1306_64x48_hw_spi() -- Solo en el branch dev
* u8g.ssd1309_128x64_hw_spi() -- Solo en el branch dev
* u8g.ssd1322_nhd31oled_bw_hw_spi() -- OSolo en el branch dev
* u8g.ssd1322_nhd31oled_gr_hw_spi() -- Solo en el branch dev
* u8g.ssd1325_nhd27oled_bw_hw_spi() -- Solo en el branch dev
* u8g.ssd1325_nhd27oled_gr_hw_spi() -- Solo en el branch dev
* u8g.ssd1327_96x96_gr_hw_spi() -- Solo en el branch dev
* u8g.ssd1351_128x128_332_hw_spi() -- Solo en el branch dev
* u8g.ssd1351_128x128gh_332_hw_spi() -- Solo en el branch dev
* u8g.ssd1351_128x128_hicolor_hw_spi() -- Solo en el branch dev
* u8g.ssd1351_128x128gh_hicolor_hw_spi() -- Solo en el branch dev
* u8g.ssd1353_160x128_332_hw_spi() -- Solo en el branch dev
* u8g.ssd1353_160x128_hicolor_hw_spi() -- Solo en el branch dev
* u8g.st7565_64128n_hw_spi() -- Solo en el branch dev
* u8g.st7565_dogm128_hw_spi() -- Solo en el branch dev
* u8g.st7565_dogm132_hw_spi() -- Solo en el branch dev
* u8g.st7565_lm6059_hw_spi() -- Solo en el branch dev
* u8g.st7565_lm6063_hw_spi() -- Solo en el branch dev
* u8g.st7565_nhd_c12832_hw_spi() -- Solo en el branch dev
* u8g.st7565_nhd_c12864_hw_spi() -- Solo en el branch dev
* u8g.uc1601_c128032_hw_spi() -- Solo en el branch dev
* u8g.uc1608_240x128_hw_spi() -- Solo en el branch dev
* u8g.uc1608_240x64_hw_spi() -- Solo en el branch dev
* u8g.uc1610_dogxl160_bw_hw_spi() -- Solo en el branch dev
* u8g.uc1610_dogxl160_gr_hw_spi() -- Solo en el branch dev
* u8g.uc1611_dogm240_hw_spi() -- Solo en el branch dev
* u8g.uc1611_dogxl240_hw_spi() -- Solo en el branch dev
* u8g.uc1701_dogs102_hw_spi() -- Solo en el branch dev
* u8g.uc1701_mini12864_hw_spi() -- Solo en el branch dev

## sub Módulo u8g.disp 
### instrucciones para manejo de la libreria u8g.
* u8g.disp:begin()
* u8g.disp:drawBitmap()
* u8g.disp:drawBox()
* u8g.disp:drawCircle()
* u8g.disp:drawDisc()
* u8g.disp:drawEllipse()
* u8g.disp:drawFilledEllipse()
* u8g.disp:drawFrame()
* u8g.disp:drawHLine()
* u8g.disp:drawLine()
* u8g.disp:drawPixel()
* u8g.disp:drawRBox()
* u8g.disp:drawRFrame()
* u8g.disp:drawStr()
* u8g.disp:drawStr90()
* u8g.disp:drawStr180()
* u8g.disp:drawStr270()
* u8g.disp:drawTriangle()
* u8g.disp:drawVLine()
* u8g.disp:drawXBM()
* u8g.disp:firstPage()
* u8g.disp:getColorIndex()
* u8g.disp:getFontAscent()
* u8g.disp:getFontDescent()
* u8g.disp:getFontLineSpacing()
* u8g.disp:getHeight()
* u8g.disp:getMode()
* u8g.disp:getWidth()
* u8g.disp:getStrWidth()
* u8g.disp:nextPage()
* u8g.disp:setColorIndex()
* u8g.disp:setDefaultBackgroundColor()
* u8g.disp:setDefaultForegroundColor()
* u8g.disp:setFont()
* u8g.disp:setFontLineSpacingFactor()
* u8g.disp:setFontPosBaseline()
* u8g.disp:setFontPosBottom()
* u8g.disp:setFontPosCenter()
* u8g.disp:setFontPosTop()
* u8g.disp:setFontRefHeightAll()
* u8g.disp:setFontRefHeightExtendedText()
* u8g.disp:setFontRefHeightText()
* u8g.disp:setRot90()
* u8g.disp:setRot180()
* u8g.disp:setRot270()
* u8g.disp:setScale2x2()
* u8g.disp:sleepOn()
* u8g.disp:sleepOff()
* u8g.disp:undoRotation()
* u8g.disp:undoScale()

##Módulo DHT
###instrucciones para el uso de sensores DHT.

* dht.read()
* dht.read11()
* dht.readxx()
-Regresar al indice