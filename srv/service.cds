using db from '../db/schema';

service myservice{
    @odata.draft.enabled
entity complaint as projection on db.complaint;
entity purchase as projection on db.purchase;
entity vendor as projection on db.vendor;
entity complist as projection on db.complist;
entity purchase1 as projection on db.purchase1;
entity files as projection on db.files;

    
entity complaint2 as projection on db.complaint2;
entity purchase2 as projection on db.purchase2;
entity vendor2 as projection on db.vendor2;
entity complist2 as projection on db.complist2;


annotate complaint with @Common.SideEffects: {
        SourceProperties: [
            'vendorcode'
        ],
        TargetEntities:[
         'comptopu'
        ]
    };
annotate purchase with @Common.SideEffects: {
        TargetProperties: [
            'po',
            'amount'
        ]
    };    

}