initialization
do: aBlock address: address bytes: size time: time
	| firstPageAddress |
	firstPageAddress := address bitClear: 1023.
	(firstPageAddress to: address + size by: 1024) do: [ :pageAddress |
		| page firstOffset lastOffset |
		page := self getPage: pageAddress atTime: time.
		"Interval within the page to fill."
		firstOffset := address - pageAddress max: 0.
		lastOffset := address + size - 1 - pageAddress min: 1023.
		(firstOffset to: lastOffset) do: [ :offset |
			aBlock value: page value: offset+1. ] ].
