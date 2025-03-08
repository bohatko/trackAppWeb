const functions = require("firebase-functions");
const admin = require("firebase-admin");
const fetch = require("node-fetch");
const { Storage } = require("@google-cloud/storage");
const storage = new Storage();
const PizZip = require("pizzip");
const Docxtemplater = require("docxtemplater");

exports.simpleReplaceInDocx = functions
  .region("europe-central2")
  .runWith({
    timeoutSeconds: 540,
    memory: "512MB",
  })
  .https.onCall(async (data, context) => {
    const {
      orderNumber,
      city,
      date,
      companynameIsp,
      companynameZak,
      docxTemplateUrl,
      companyadresIsp,
      innIsp,
      kppIsp,
      ogrnIsp,
      rsIsp,
      ksIsp,
      bikIsp,
      tsIsp,
      orderprice,
      adressRabot,
      companyAdresZak,
      innZak,
      kppZak,
      ogrnZak,
      rsZak,
      ksZak,
      bikZak,
      fioDirZak,
      fioDirIsp,
      qsmen,
      startOrder,
      bankZak,
      rateHour,
      companyOKPOZak,
      companyOKPOIsp,
      phoneNumberZAk,
      markTehnik,
      gosnumber,
      hoursINSmena,
      voditelName,
      nds,
      summNds,
      priceOborudov,
    } = data;

    // Write your code below!
    console.log("Data received:", data);
    try {
      console.log("Downloading DOCX template from:", docxTemplateUrl);

      const response = await fetch(docxTemplateUrl);
      if (!response.ok) {
        console.error("Failed to download DOCX template");
        throw new Error("Не удалось загрузить DOCX-шаблон");
      }
      const docxBuffer = await response.arrayBuffer();

      console.log("DOCX template downloaded successfully");

      const zip = new PizZip(docxBuffer);
      const doc = new Docxtemplater(zip, {
        paragraphLoop: true,
        linebreaks: true,
      });

      const placeholders = {
        orderNumber,
        city,
        date,
        companynameIsp,
        companynameZak,
        docxTemplateUrl,
        companyadresIsp,
        innIsp,
        kppIsp,
        ogrnIsp,
        rsIsp,
        ksIsp,
        bikIsp,
        tsIsp,
        orderprice,
        adressRabot,
        companyAdresZak,
        innZak,
        kppZak,
        ogrnZak,
        rsZak,
        ksZak,
        bikZak,
        fioDirZak,
        fioDirIsp,
        qsmen,
        startOrder,
        bankZak,
        rateHour,
        companyOKPOZak,
        companyOKPOIsp,
        phoneNumberZAk,
        markTehnik,
        gosnumber,
        hoursINSmena,
        nds,
        voditelName,
        summNds,
        priceOborudov,
      };
      doc.render(placeholders);

      const updatedDocxBuffer = doc.getZip().generate({ type: "nodebuffer" });

      console.log("Placeholders replaced in DOCX");

      // Сохранение изменённого документа в Firebase Storage
      const bucket = storage.bucket("track-app-uxjczg.appspot.com");
      const docxFileName = `updated-docx/${Date.now()}.docx`;
      const file = bucket.file(docxFileName);

      await file.save(updatedDocxBuffer, {
        metadata: {
          contentType:
            "application/vnd.openxmlformats-officedocument.wordprocessingml.document",
        },
      });

      console.log("DOCX saved to Firebase Storage");

      // Генерация и возврат подписанной URL
      const [url] = await file.getSignedUrl({
        action: "read",
        expires: "2491-03-09",
      });

      console.log("Signed URL generated:", url);

      return { docxUrl: url };
    } catch (error) {
      console.error("Error:", error.message);
      throw new functions.https.HttpsError("internal", error.message);
    }
    // Write your code above!
  });
