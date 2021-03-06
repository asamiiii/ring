/*
**	Project : Form Designer 
**	File Purpose :  QComboBox Control
**	Date : 2017.04.29
**	Author :  Mahmoud Fayed <msfclipper@yahoo.com>
*/

package formdesigner

class FormDesigner_QComboBox from QComboBox

	CreateCommonAttributes()
	CreateMoveResizeCornersAttributes()

	cItems = ""
	cCurrentIndex  = ""

	cactivatedEvent = ""
	ccurrentIndexChangedEvent = ""
	ceditTextChangedEvent = ""
	chighlightedEvent = ""

	func SetcItems cValue
		cItems = cValue

	func cItemsValue
		return cItems

	func setcCurrentIndex cValue
		cCurrentIndex = cValue

	func cCurrentIndexValue
		return cCurrentIndex

	func SetactivatedEventCode cValue
		cactivatedEvent = cValue

	func activatedEventCode
		return cactivatedEvent

	func SetcurrentIndexChangedEventCode cValue
		ccurrentIndexChangedEvent = cValue

	func currentIndexChangedEventCode
		return ccurrentIndexChangedEvent

	func SeteditTextChangedEventCode cValue
		ceditTextChangedEvent = cValue

	func editTextChangedEventCode
		return ceditTextChangedEvent

	func SethighlightedEventCode cValue
		chighlightedEvent = cValue

	func highlightedEventCode
		return chighlightedEvent

	func AddObjectProperties  oDesigner
		AddObjectCommonProperties(oDesigner)
		oDesigner.oView.AddProperty("Items (S: Comma)",False)
		oDesigner.oView.AddProperty("Current Index",False)
		oDesigner.oView.AddProperty("activatedEvent",False)
		oDesigner.oView.AddProperty("currentIndexChangedEvent",False)
		oDesigner.oView.AddProperty("editTextChangedEvent",False)
		oDesigner.oView.AddProperty("highlightedEvent",False)

	func DisplayProperties oDesigner
		DisplayCommonProperties(oDesigner)
		oPropertiesTable = oDesigner.oView.oPropertiesTable
		oPropertiesTable.Blocksignals(True)
		oPropertiesTable.item(C_AFTERCOMMON,1).settext(cItemsValue())
		oPropertiesTable.item(C_AFTERCOMMON+1,1).settext(cCurrentIndexValue())
		oPropertiesTable.item(C_AFTERCOMMON+2,1).settext(activatedEventcode())
		oPropertiesTable.item(C_AFTERCOMMON+3,1).settext(currentIndexChangedEventcode())
		oPropertiesTable.item(C_AFTERCOMMON+4,1).settext(editTextChangedEventcode())
		oPropertiesTable.item(C_AFTERCOMMON+5,1).settext(highlightedEventcode())
		oPropertiesTable.Blocksignals(False)
		# Set the object name
			clear() AddItem(oDesigner.oModel.GetObjectName(self),0)


	func UpdateProperties oDesigner,nRow,nCol,cValue
		UpdateCommonProperties(oDesigner,nRow,nCol,cValue)
		if nCol = 1 {
			switch nRow {
				case C_AFTERCOMMON
					setcItems(cValue)
				case C_AFTERCOMMON+1
					setcCurrentIndex(cValue)
				case C_AFTERCOMMON+2
					setactivatedEventCode(cValue)
				case C_AFTERCOMMON+3
					setcurrentIndexChangedEventCode(cValue)
				case C_AFTERCOMMON+4
					seteditTextChangedEventCode(cValue)
				case C_AFTERCOMMON+5
					sethighlightedEventCode(cValue)
			}
		}
		# Set the object name
			clear() AddItem(oDesigner.oModel.GetObjectName(self),0)


	func ObjectDataAsString oDesigner,nTabsCount
		cOutput = ObjectDataAsString2(oDesigner,nTabsCount)
		cTabs = std_copy(char(9),nTabsCount)
		cOutput += "," + nl + cTabs + ' :cItems =  "' + cItemsValue() + '"'
		cOutput += "," + nl + cTabs + ' :cCurrentIndex =  "' + cCurrentIndexValue() + '"'
		cOutput += "," + nl + cTabs + ' :setactivatedEvent =  "' + activatedEventCode() + '"'
		cOutput += "," + nl + cTabs + ' :setcurrentIndexChangedEvent =  "' + currentIndexChangedEventCode() + '"'
		cOutput += "," + nl + cTabs + ' :seteditTextChangedEvent =  "' + editTextChangedEventCode() + '"'
		cOutput += "," + nl + cTabs + ' :sethighlightedEvent =  "' + highlightedEventCode() + '"'
		return cOutput

	func GenerateCustomCode oDesigner
		cOutput = ""
		if cItemsValue() != NULL {
			aItems = split(cItemsValue(),",")
			for item in aItems {
				cOutput += 'AddItem("#{f1}",0)' + nl
				cOutput = substr(cOutput,"#{f1}",Item)
			}
		}
		if cCurrentIndexValue() != NULL {
			cOutput += 'setcurrentIndex(#{f1})' + nl
			cOutput = substr(cOutput,"#{f1}",ccurrentIndexValue())
		}
		cOutput += 'setactivatedEvent("#{f1}")' + nl
		cOutput = PrepareEvent(cOutput,activatedEventCode(),"#{f1}")
		cOutput = substr(cOutput,"#{f1}",activatedEventCode())
		cOutput += 'setcurrentIndexChangedEvent("#{f1}")' + nl
		cOutput = PrepareEvent(cOutput,currentIndexChangedEventCode(),"#{f1}")
		cOutput = substr(cOutput,"#{f1}",currentIndexChangedEventCode())
		cOutput += 'seteditTextChangedEvent("#{f1}")' + nl
		cOutput = PrepareEvent(cOutput,editTextChangedEventCode(),"#{f1}")
		cOutput = substr(cOutput,"#{f1}",editTextChangedEventCode())
		cOutput += 'sethighlightedEvent("#{f1}")' + nl
		cOutput = PrepareEvent(cOutput,highlightedEventCode(),"#{f1}")
		cOutput = substr(cOutput,"#{f1}",highlightedEventCode())
		return cOutput

	func RestoreProperties oDesigner,Item
		RestoreCommonProperties(oDesigner,item)
		itemdata = item[:data]
		SetcItems(itemdata[:cItems])
		SetcCurrentIndex(itemdata[:cCurrentIndex])
		SetactivatedEventCode(itemdata[:setactivatedEvent])
		SetcurrentIndexChangedEventCode(itemdata[:setcurrentIndexChangedEvent])
		SeteditTextChangedEventCode(itemdata[:seteditTextChangedEvent])
		SethighlightedEventCode(itemdata[:sethighlightedEvent])
