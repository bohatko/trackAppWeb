const admin = require("firebase-admin/app");
admin.initializeApp();

const simpleReplaceInDocx = require("./simple_replace_in_docx.js");
exports.simpleReplaceInDocx = simpleReplaceInDocx.simpleReplaceInDocx;
const cancelOrders = require("./cancel_orders.js");
exports.cancelOrders = cancelOrders.cancelOrders;
