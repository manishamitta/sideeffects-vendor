namespace db;

using { cuid, managed } from '@sap/cds/common';
//application 1
entity complaint{
  key id: UUID;
  pankey: String @mandatory;
  vendorcode: String;
  complaintid: String;
  complainttype: String;
  status: String;
  po: String;
  amount: String;
  comptopu: Composition of many purchase on comptopu.vendorcode = vendorcode;

}

entity purchase{
  key po: String;
  vendorcode: String;
  amount: String;
  putocomp: Association to complaint;

}
//search help
entity vendor{
 key vendorcode: String;
}
entity complist{
  key complaints: String;
}
entity purchase1{
  key po: String;
  vendorcode: String;
  amount: String;
}

entity files:cuid,managed {
@Core.MediaType  : mediaType
content   : LargeBinary;
@Core.IsMediaType: true
mediaType : String;
fileName  : String;
size      : Integer;
url       : String;
}

// application2
entity vendor2{
 key pankey: String;
 key vendorcode: String; 
 ventopu: Composition of many purchase2 on ventopu.vendorcode = vendorcode;
}
entity purchase2{
  key po: String;
  amount: String;
  vendorcode: String;
  putoven: Association to one vendor2 on putoven.vendorcode = vendorcode;
  putocomp: Composition of one complaint2 on putocomp.po = po;
}
entity complaint2{  
key complaintid: String;
  complainttype: String;
  status: String;
  po: String;
  comptopu: Association to one purchase2 on comptopu.po = po;

}
entity complist2{
  key complaints: String;
}