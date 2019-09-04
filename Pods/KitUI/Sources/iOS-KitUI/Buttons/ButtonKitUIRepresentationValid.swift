//
//  File.swift
//  
//
//  Created by Jeffrey Macko on 11/06/2019.
//

import Foundation

let ButtonKitUIRepresentationJSONFile = """
[
	{
		"style": "brand",
		"layout": "light",
		"sizes": [
			{
				"mode": "medium",
				"font": 16,
				"borderRadius": 3.0,
				"contentEdgeInsets": {
					"top": 12.0,
					"left": 12.0,
					"bottom": 12.0,
					"right": 12.0
				},
				"height": 40
			},
			{
				"mode": "small",
				"font": 14,
				"borderRadius": 3.0,
				"contentEdgeInsets": {
					"top": 9.0,
					"left": 9.0,
					"bottom": 9.0,
					"right": 9.0
				},
				"height": 32
			},
			{
				"mode": "extended",
				"font": 16,
				"borderRadius": 3.0,
				"contentEdgeInsets": {
					"top": 12.0,
					"left": 12.0,
					"bottom": 12.0,
					"right": 12.0
				},
				"expended": "conserveSpacing",
				"height": 40
			},
			{
				"mode": "full",
				"font": 18,
				"borderRadius": 3.0,
				"contentEdgeInsets": {
					"top": 12.0,
					"left": 12.0,
					"bottom": 12.0,
					"right": 12.0
				},
				"expended": "full",
				"height": 40
			},
			{
				"mode": "fab",
				"borderRadius": 20.0,
				"imageHeight": 24,
				"imageWidth": 24,
				"height": 56,
				"width": 56
			}
		],
		"controlStates": [
			{
				"mode": "normal",
				"backgroundColor": "#ffec00",
				"font": "roman",
				"fontColor": "#333333"
			},
			{
				"mode": "selected",
				"backgroundColor": "#ffec00",
				"font": "roman",
				"fontColor": "#333333"
			},
			{
				"mode": "highlighted",
				"backgroundColor": "#ffec00",
				"font": "roman",
				"fontColor": "#FFC700"
			},
			{
				"mode": "disabled",
				"backgroundColor": "#F3F3F3",
				"font": "roman",
				"fontColor": "#999999"
			}
		]
	},
	{
		"style": "basic",
		"layout": "light",
		"sizes": [
			{
				"mode": "medium",
				"font": 16,
				"borderRadius": 3.0,
				"contentEdgeInsets": {
					"top": 12.0,
					"left": 12.0,
					"bottom": 12.0,
					"right": 12.0
				},
				"height": 40
			},
			{
				"mode": "small",
				"font": 14,
				"borderRadius": 3.0,
				"contentEdgeInsets": {
					"top": 9.0,
					"left": 9.0,
					"bottom": 9.0,
					"right": 9.0
				},
				"height": 32
			}
		],
		"controlStates": [
			{
				"mode": "normal",
				"backgroundColor": "#f3f3f3",
				"font": "roman",
				"fontColor": "#0078ff"
			},
			{
				"mode": "selected",
				"backgroundColor": "#f3f3f3",
				"font": "roman",
				"fontColor": "#0078ff"
			},
			{
				"mode": "highlighted",
				"backgroundColor": "#f3f3f3",
				"font": "roman",
				"fontColor": "#97C8FF"
			},
			{
				"mode": "disabled",
				"backgroundColor": "#F3F3F3",
				"font": "roman",
				"fontColor": "#999999"
			}
		]
	},
	{
		"style": "outline",
		"layout": "light",
		"sizes": [
			{
				"mode": "medium",
				"font": 16,
				"borderRadius": 3.0,
				"contentEdgeInsets": {
					"top": 12.0,
					"left": 12.0,
					"bottom": 12.0,
					"right": 12.0
				},
				"height": 40
			},
			{
				"mode": "small",
				"font": 14,
				"borderRadius": 3.0,
				"contentEdgeInsets": {
					"top": 9.0,
					"left": 9.0,
					"bottom": 9.0,
					"right": 9.0
				},
				"height": 32
			}
		],
		"controlStates": [
			{
				"mode": "normal",
				"backgroundColor": "clear",
				"font": "roman",
				"fontColor": "#0078ff",
				"border": {
					"color": "#0078ff",
					"size": 1
				}
			},
			{
				"mode": "selected",
				"backgroundColor": "clear",
				"font": "roman",
				"fontColor": "#0078ff",
				"border": {
        "color": "#0078ff",
					"size": 1
				}
			},
			{
				"mode": "highlighted",
				"backgroundColor": "clear",
				"font": "roman",
				"fontColor": "#97C8FF",
				"border": {
					"color": "#97C8FF",
					"size": 1
				}
			},
			{
				"mode": "disabled",
				"backgroundColor": "clear",
				"font": "roman",
				"fontColor": "#999999",
				"border": {
					"color": "#CCCCCC",
					"size": 1
				}
			}
		]
	},
	{
		"style": "outline",
		"layout": "dark",
		"sizes": [
			{
				"mode": "medium",
				"font": 16,
				"borderRadius": 3.0,
				"contentEdgeInsets": {
					"top": 12.0,
					"left": 12.0,
					"bottom": 12.0,
					"right": 12.0
				},
				"height": 40
			},
			{
				"mode": "small",
				"font": 14,
				"borderRadius": 3.0,
				"contentEdgeInsets": {
					"top": 9.0,
					"left": 9.0,
					"bottom": 9.0,
					"right": 9.0
				},
				"height": 32
			}
		],
		"controlStates": [
			{
				"mode": "normal",
				"backgroundColor": "clear",
				"font": "roman",
				"fontColor": "#ffffff",
				"border": {
					"color": "#ffffff",
					"size": 1
				}
			},
			{
				"mode": "selected",
				"backgroundColor": "clear",
				"font": "roman",
				"fontColor": "#ffffff",
				"border": {
					"color": "#ffffff",
					"size": 1
				}
			},
			{
				"mode": "highlighted",
				"backgroundColor": "clear",
				"font": "roman",
				"fontColor": "#999999",
				"border": {
					"color": "#999999",
					"size": 1
				}
			},
			{
				"mode": "disabled",
				"backgroundColor": "clear",
				"font": "roman",
				"fontColor": "#999999",
				"border": {
					"color": "#999999",
					"size": 1
				}
			}
		]
	},
	{
		"style": "link",
		"layout": "light",
		"sizes": [
			{
				"mode": "medium",
				"font": 16,
				"borderRadius": 3.0,
				"contentEdgeInsets": {
					"top": 12.0,
					"left": 12.0,
					"bottom": 12.0,
					"right": 12.0
				},
				"height": 40
			},
			{
				"mode": "small",
				"font": 14,
				"borderRadius": 3.0,
				"contentEdgeInsets": {
					"top": 9.0,
					"left": 9.0,
					"bottom": 9.0,
					"right": 9.0
				},
				"height": 32
			}
		],
		"controlStates": [
			{
				"mode": "normal",
				"backgroundColor": "clear",
				"font": "roman",
				"fontColor": "#0078ff"
			},
			{
				"mode": "selected",
				"backgroundColor": "clear",
				"font": "roman",
				"fontColor": "#0078ff"
			},
			{
				"mode": "highlighted",
				"backgroundColor": "clear",
				"font": "roman",
				"fontColor": "#97C8FF"
			},
			{
				"mode": "disabled",
				"backgroundColor": "clear",
				"font": "roman",
				"fontColor": "#999999"
			}
		]
	},
	{
		"style": "link",
		"layout": "dark",
		"sizes": [
			{
				"mode": "medium",
				"font": 16,
				"borderRadius": 3.0,
				"contentEdgeInsets": {
					"top": 12.0,
					"left": 12.0,
					"bottom": 12.0,
					"right": 12.0
				},
				"height": 40
			},
			{
				"mode": "small",
				"font": 14,
				"borderRadius": 3.0,
				"contentEdgeInsets": {
					"top": 9.0,
					"left": 9.0,
					"bottom": 9.0,
					"right": 9.0
				},
				"height": 32
			}
		],
		"controlStates": [
			{
				"mode": "normal",
				"backgroundColor": "clear",
				"font": "roman",
				"fontColor": "#ffffff"
			},
			{
				"mode": "selected",
				"backgroundColor": "clear",
				"font": "roman",
				"fontColor": "#ffffff"
			},
			{
				"mode": "highlighted",
				"backgroundColor": "clear",
				"font": "roman",
				"fontColor": "#999999"
			},
			{
				"mode": "disabled",
				"backgroundColor": "clear",
				"font": "roman",
				"fontColor": "#999999"
			}
		]
	},
	{
		"style": "plain",
		"layout": "light",
		"sizes": [
			{
				"mode": "medium",
				"font": 16,
				"borderRadius": 3.0,
				"contentEdgeInsets": {
					"top": 12.0,
					"left": 12.0,
					"bottom": 12.0,
					"right": 12.0
				},
				"height": 40
			},
			{
				"mode": "small",
				"font": 14,
				"borderRadius": 3.0,
				"contentEdgeInsets": {
					"top": 9.0,
					"left": 9.0,
					"bottom": 9.0,
					"right": 9.0
				},
				"height": 32
			},
			{
				"mode": "extended",
				"font": 16,
				"borderRadius": 3.0,
				"contentEdgeInsets": {
					"top": 12.0,
					"left": 12.0,
					"bottom": 12.0,
					"right": 12.0
				},
				"expended": "conserveSpacing",
				"height": 40
			},
			{
				"mode": "full",
				"font": 18,
				"borderRadius": 3.0,
				"contentEdgeInsets": {
					"top": 12.0,
					"left": 12.0,
					"bottom": 12.0,
					"right": 12.0
				},
				"expended": "full",
				"height": 40
			},
			{
				"mode": "fab",
				"borderRadius": 20.0,
				"imageHeight": 24,
				"imageWidth": 24,
				"height": 56,
				"width": 56
			}
		],
		"controlStates": [
			{
				"mode": "normal",
				"backgroundColor": "#0078ff",
				"font": "roman",
				"fontColor": "#ffffff"
			},
			{
				"mode": "selected",
				"backgroundColor": "#0078ff",
				"font": "roman",
				"fontColor": "#ffffff"
			},
			{
				"mode": "highlighted",
				"backgroundColor": "#0078ff",
				"font": "roman",
				"fontColor": "#97C8FF"
			},
			{
				"mode": "disabled",
				"backgroundColor": "#F3F3F3",
				"font": "roman",
				"fontColor": "#999999"
			}
		]
	},
	{
		"style": "plain",
		"layout": "dark",
		"sizes": [
			{
				"mode": "medium",
				"font": 16,
				"borderRadius": 3.0,
				"contentEdgeInsets": {
					"top": 12.0,
					"left": 12.0,
					"bottom": 12.0,
					"right": 12.0
				},
				"height": 40
			},
			{
				"mode": "small",
				"font": 14,
				"borderRadius": 3.0,
				"contentEdgeInsets": {
					"top": 9.0,
					"left": 9.0,
					"bottom": 9.0,
					"right": 9.0
				},
				"height": 32
			},
			{
				"mode": "extended",
				"font": 16,
				"borderRadius": 3.0,
				"contentEdgeInsets": {
					"top": 12.0,
					"left": 12.0,
					"bottom": 12.0,
					"right": 12.0
				},
				"expended": "conserveSpacing",
				"height": 40
			},
			{
				"mode": "full",
				"font": 18,
				"borderRadius": 3.0,
				"contentEdgeInsets": {
					"top": 12.0,
					"left": 12.0,
					"bottom": 12.0,
					"right": 12.0
				},
				"expended": "full",
				"height": 40
			},
			{
				"mode": "fab",
				"borderRadius": 20.0,
				"imageHeight": 24,
				"imageWidth": 24,
				"height": 56,
				"width": 56
			}
		],
		"controlStates": [
			{
				"mode": "normal",
				"backgroundColor": "#0078ff",
				"font": "roman",
				"fontColor": "#ffffff"
			},
			{
				"mode": "selected",
				"backgroundColor": "#0078ff",
				"font": "roman",
				"fontColor": "#ffffff"
			},
			{
				"mode": "highlighted",
				"backgroundColor": "#0078ff",
				"font": "roman",
				"fontColor": "#97C8FF"
			},
			{
				"mode": "disabled",
				"backgroundColor": "#F3F3F3",
				"font": "roman",
				"fontColor": "#999999"
			}
		]
	}
]
"""
