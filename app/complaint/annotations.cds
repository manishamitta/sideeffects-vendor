using myservice as service from '../../srv/service';

annotate service.complaint with @(
    UI.LineItem : [
        {
            $Type : 'UI.DataField',
            Label : 'Complaint Id',
            Value : complaintid,
        },
        {
            $Type : 'UI.DataField',
            Label : 'Status',
            Value : status,
        },
        {
            $Type : 'UI.DataField',
            Value : pankey,
            Label : 'Pan Key',
        },
    ]
);

annotate service.complaint with @(
    UI.FieldGroup #GeneratedGroup1 : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Label : 'Pan Key',
                Value : pankey,
            },
            {
                $Type : 'UI.DataField',
                Label : 'Vendor Code',
                Value : vendorcode,
            },
        ],
    },
    UI.Facets : [
        {
            $Type : 'UI.ReferenceFacet',
            ID : 'GeneratedFacet1',
            Label : 'General Information',
            Target : '@UI.FieldGroup#GeneratedGroup1',
        },
        {
            $Type : 'UI.ReferenceFacet',
            Label : 'PO Details',
            ID : 'PODetails',
            Target : 'comptopu/@UI.LineItem#PODetails',
        },
        {
            $Type : 'UI.ReferenceFacet',
            Label : 'Complaint',
            ID : 'Complaint',
            Target : '@UI.FieldGroup#Complaint',
        },
    ]
);
annotate service.purchase with @(
    UI.LineItem #PODetails : [
        {
            $Type : 'UI.DataField',
            Value : amount,
            Label : 'amount',
        },{
            $Type : 'UI.DataField',
            Value : po,
            Label : 'po',
        },]
);
annotate service.complaint with @(
    UI.FieldGroup #Complaint : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Value : complaintid,
                Label : 'Complaint Id',
            },{
                $Type : 'UI.DataField',
                Value : complainttype,
                Label : 'Complaint',
            },{
                $Type : 'UI.DataField',
                Value : status,
                Label : 'Status',
            },],
    }
);
annotate service.complaint with {
    vendorcode @(Common.ValueList : {
            $Type : 'Common.ValueListType',
            CollectionPath : 'vendor',
            Parameters : [
                {
                    $Type : 'Common.ValueListParameterInOut',
                    LocalDataProperty : vendorcode,
                    ValueListProperty : 'vendorcode',
                },
            ],
            Label : 'vendorcode',
        },
        Common.ValueListWithFixedValues : true
)};
annotate service.complaint with {
    complainttype @(Common.ValueList : {
            $Type : 'Common.ValueListType',
            CollectionPath : 'complist',
            Parameters : [
                {
                    $Type : 'Common.ValueListParameterInOut',
                    LocalDataProperty : complainttype,
                    ValueListProperty : 'complaints',
                },
            ],
            Label : 'complaints',
        },
        Common.ValueListWithFixedValues : true
)};
annotate service.complaint with @(
    UI.HeaderInfo : {
        Title : {
            $Type : 'UI.DataField',
            Value : complaintid,
        },
        TypeName : '',
        TypeNamePlural : '',
    }
);