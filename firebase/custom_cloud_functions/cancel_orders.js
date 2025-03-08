const functions = require("firebase-functions");
const admin = require("firebase-admin");

// To avoid deployment errors, do not call admin.initializeApp() in your code

exports.cancelOrders = functions
  .region("europe-central2")
  .runWith({
    timeoutSeconds: 540,
    memory: "1GB",
  })
  .pubsub.schedule("0 * * * *") // Run every hour at the beginning of the hour
  .timeZone("Europe/Moscow") // Ensure the correct time zone is set
  .onRun(async (context) => {
    // Write your code below!
    const db = admin.firestore(); // Получаем доступ к Firestore
    const now = admin.firestore.Timestamp.now(); // Текущее время

    try {
      // Находим заказы с статусом 'Новый' и временем начала меньше текущего
      const ordersQuerySnapshot = await db
        .collection("orders")
        .where("order_status", "==", "Новый")
        .where("start_time", "<", now)
        .get();

      // Если такие заказы найдены, обновляем их статус
      if (!ordersQuerySnapshot.empty) {
        const batch = db.batch(); // Используем батч для групповой записи
        ordersQuerySnapshot.forEach((doc) => {
          batch.update(doc.ref, { order_status: "Отменён" });
        });

        await batch.commit(); // Применяем все обновления
        console.log(`Отменено ${ordersQuerySnapshot.size} заказов.`);
      } else {
        console.log("Нет заказов для отмены.");
      }
    } catch (error) {
      console.error("Ошибка при отмене заказов:", error);
    }
    // Write your code above!
  });
