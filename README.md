# Flutter Blog Application

A feature-rich Flutter blog application built using a custom backend REST API.

---

## **Key Features**
- Seamless integration with a custom backend REST API.
- Efficient local storage with Hive for offline support.
- Image caching for better performance.

---

## **Technical Skills Utilized**
1. **Flutter**: Framework for building natively compiled applications.
2. **Dart**: Programming language used for Flutter development.
3. **REST API Integration**: Communication between frontend and backend.
4. **Hive**: Local storage solution for Flutter.
5. **Image Caching**: Enhances app performance by caching images.

---

## **Challenges Faced and Solutions**

### **1. Hive-Related Error While Fetching Updated Data**
- **Problem**: After updating the database, fetching data caused errors.
- **Solution**: Issue resolved by reviewing Hive configurations and updating the data fetching mechanism.

### **2. Adapter Generation Failure (Hive)**
- **Problem**: Adapter generation for Hive failed during the build process.
- **Solution**: Make sure the model file name and the file your trying to generate is same for example: your model name is product.dart then write part'product.g.dart'

---

## **Backend Integration**
- The application is powered by a custom backend REST API.
- Explore the backend code: [GitHub Repository](https://github.com/SakibvHossain/Blogging_Application_Backend)

---
