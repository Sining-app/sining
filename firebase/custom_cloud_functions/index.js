const admin = require("firebase-admin/app");
admin.initializeApp();
    
const calculateAverageAndUpdateUser = require('./calculate_average_and_update_user.js');
exports.calculateAverageAndUpdateUser = calculateAverageAndUpdateUser.calculateAverageAndUpdateUser;