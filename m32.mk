deal_rec = zoho.crm.getRecordById("Deals",deal_id); //info deal_rec;
ref_id = deal_rec.get("Reference_ID");
contact_name = deal_rec.get("Contact_Name");
deal_name = deal_rec.get("Deal_Name");
description = deal_rec.get("Description");
product = deal_rec.get("Product"); info product;
mp = Map();
mp.put("Subject", deal_name)
mp.put("Reference_ID",ref_id);
mp.put("Account_Name",contact_name);
mp.put("Subject",deal_name);
mp.put("Description",description);

itemlist = List();
// // for each rec in product
// // {
itemmap = Map();
itemmap.put("Product_Name",product.get("id"));
itemmap.put("unit",product.get("Unit"));
itemlist.add(itemmap); 

mp.put("Quoted_Items",itemlist);

datalist = List();
datalist.add(mp);

param = Map (); 
param.put("data",datalist);

info "param : " + param; 

// create_quote = zoho.crm.createRecord("Quotes",mp);
// info create_quote;

create_quote = invokeurl
[
url :"https://www.zohoapis.in/crm/v5/Quotes"
type : POST
parameters: param.toString()
connection:"zohocrm"
];

info "create_quote : " + create_quote;
	 
	 
// }
return "Quote has been created Successfully.";