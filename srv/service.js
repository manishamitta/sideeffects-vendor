const cds = require('@sap/cds');
const { parseArgs } = require('util');
module.exports = cds.service.impl(async function () {
    let {
        complaint,
        purchase,
        purchase1
    } = this.entities;

    this.on('READ', complaint.drafts, async (req, next) => {

        if (req.data.vendorcode) {
            debugger
            // await DELETE.from(purchase.drafts)
            // await DELETE.from(purchase)
            var data1 = await SELECT.from(purchase1).where({ vendorcode: req.data.vendorcode });

            let drafttable = await SELECT.from("DRAFT_DRAFTADMINISTRATIVEDATA");
            // console.log(data1);
            const entries = data1.map(record => ({
                po: record.po,
                amount: record.amount,
                vendorcode: record.vendorcode,
                DRAFTADMINISTRATIVEDATA_DRAFTUUID: drafttable[drafttable.length - 1].DRAFTUUID
            }));
            // var po = data1[0].po;
            // var am = data1[0].amount;
            // let data = await SELECT.from(purchase.drafts);
            await DELETE.from(purchase.drafts)
            // await DELETE.from(purchase)
            await INSERT.into(purchase.drafts).entries(entries);

            // await cds.update(purchase.drafts)
            // .set({po:po}) // Update with new data
        }
        return next();
    },
    this.before('CREATE', 'files', req => {
        console.log('Create called')
        console.log(JSON.stringify(req.data))
        req.data.url = `/odata/v4/myservice/files(${req.data.ID})/content`
    }),
    this.before('READ', 'files', req => {
        //check content-type
        console.log('content-type: ', req.headers['content-type'])
    })
    );
});


