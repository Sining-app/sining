const functions = require('firebase-functions');
const admin = require('firebase-admin');

const firestore = admin.firestore();

exports.calculateAverageAndUpdateUser = functions.firestore
  .document('reviews/{reviewId}')
  .onWrite((change, context) => {
    const newData = change.after.data(); // Retrieve changed data

    const reviewedRef = newData.reviewed; // Assuming 'reviewed' holds a reference to the user being reviewed

    const reviewsCollection = firestore.collection('reviews').where('reviewed', '==', reviewedRef);

    return reviewsCollection.get()
      .then(querySnapshot => {
        let totalrate1 = 0, totalrate2 = 0, totalrate3 = 0, totalrate4 = 0, count = 0;
        
        querySnapshot.forEach(doc => {
          const data = doc.data();
          totalrate1 += data.rate1;
          totalrate2 += data.rate2;
          totalrate3 += data.rate3;
          totalrate4 += data.rate4;
          count++;
        });

        const averagerate1 = totalrate1 / count;
        const averagerate2 = totalrate2 / count;
        const averagerate3 = totalrate3 / count;
        const averagerate4 = totalrate4 / count;
        const averageOfAverages = (averagerate1 + averagerate2 + averagerate3 + averagerate4) / 4;

        // Extract path from document reference
        const userPath = reviewedRef.path;

        // Get user document reference from the path
        const userRef = firestore.doc(userPath);

        return userRef.update({
          rate1: averagerate1,
          rate2: averagerate2,
          rate3: averagerate3,
          rate4: averagerate4,
          average: averageOfAverages,
        });
      })
      .catch(error => {
        console.error(`Error: ${error}`);
        return null;
      });
  });