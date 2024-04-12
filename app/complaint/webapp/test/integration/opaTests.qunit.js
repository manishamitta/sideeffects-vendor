sap.ui.require(
    [
        'sap/fe/test/JourneyRunner',
        'complaint/test/integration/FirstJourney',
		'complaint/test/integration/pages/complaintList',
		'complaint/test/integration/pages/complaintObjectPage'
    ],
    function(JourneyRunner, opaJourney, complaintList, complaintObjectPage) {
        'use strict';
        var JourneyRunner = new JourneyRunner({
            // start index.html in web folder
            launchUrl: sap.ui.require.toUrl('complaint') + '/index.html'
        });

       
        JourneyRunner.run(
            {
                pages: { 
					onThecomplaintList: complaintList,
					onThecomplaintObjectPage: complaintObjectPage
                }
            },
            opaJourney.run
        );
    }
);