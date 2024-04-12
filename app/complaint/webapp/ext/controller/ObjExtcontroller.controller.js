sap.ui.define(['sap/ui/core/mvc/ControllerExtension'], function (ControllerExtension) {
	'use strict';

	return ControllerExtension.extend('complaint.ext.controller.ObjExtcontroller', {
		// this section allows to extend lifecycle hooks or hooks provided by Fiori elements
		override: {
			/**
             * Called when a controller is instantiated and its View controls (if available) are already created.
             * Can be used to modify the View before it is displayed, to bind event handlers and do other one-time initialization.
             * @memberOf complaint.ext.controller.ObjExtcontroller
             */
			onInit: function () {
				// you can access the Fiori elements extensionAPI via this.base.getExtensionAPI
				var oModel = this.base.getExtensionAPI().getModel();
			},
			editFlow: {
				onBeforeSave: function(oEvent){
					debugger
					var cid = sap.ui.getCore().byId("complaint::complaintObjectPage--fe::FormContainer::Complaint::FormElement::DataField::complaintid::Field-content").mAggregations.contentDisplay.mProperties.text;
				if (cid === ""){
				// Generate a random number
				var randomNumber = Math.floor(Math.random() * 1000000);
			
				// Get the current timestamp
				var timestamp = new Date().getTime();
			
				// Combine timestamp and random number to create a unique ID
				var uniqueId = timestamp + '-' + randomNumber;
					sap.ui.getCore().byId("complaint::complaintObjectPage--fe::FormContainer::Complaint::FormElement::DataField::complaintid::Field-content").mAggregations.contentDisplay.setText(uniqueId);
					sap.ui.getCore().byId("complaint::complaintObjectPage--fe::FormContainer::Complaint::FormElement::DataField::status::Field-content").mAggregations.contentDisplay.setText("submitted");
				}
			}
		}
		// routing: {
		// 	onBeforeBinding: function(){
		// 		debugger;
		// 		sap.ui.getCore().byId("complaint::complaintObjectPage--fe::StandardAction::Delete").setVisible(false);
		// 		// sap.ui.getCore().byId("complaint::complaintObjectPage--fe::table::comptopu::LineItem::PODetails::StandardAction::Create").setVisible(false);
		// 		// sap.ui.getCore().byId("complaint::complaintObjectPage--fe::table::comptopu::LineItem::PODetails::StandardAction::Delete").setVisible(false);
		// 	}
		// }
		}
	});
});