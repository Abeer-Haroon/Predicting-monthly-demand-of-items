# Predicting monthly demand of items

## Prerequisites

1. Sign up for an [IBM Cloud account](https://cloud.ibm.com/registration/).
2. Download or Clone this repo.

## Estimated time

This tutorial takes about 20 minutes to complete if you already have an IBM cloud account set up.

## Steps

1. Create an instance of the Watson Machine Learning
   - Go to the [Watson Machine Learning]( https://cloud.ibm.com/catalog/services/machine-learning) page in the IBM Cloud Catalog.
   - Click **Create**.
   
2. Create an instance of the Cloud Object Storage
   - Go to the [Cloud Object Storage](https://cloud.ibm.com/catalog/services/cloud-object-storage) page in the IBM Cloud Catalog.
   - Click **Create**.
   
3. Create an instance of the IBM Cognos Dashboard Embedded
   - Go to the [IBM Cognos Dashboard Embedded](https://cloud.ibm.com/catalog/services/ibm-cognos-dashboard-embedded) page in the IBM Cloud Catalog.
   - Click **Create**.

4. Create an instance of the Watson Studio
   - Go to the [Watson Studio](https://cloud.ibm.com/catalog/services/watson-studio?bss_account=e366b6e4fb004c5eaccfbe7042b670a4) page in the IBM Cloud Catalog.
   - Click **Create**.

![](https://github.com/Abeer-Haroon/AI-Treasure-Hunt-With-Watson/blob/master/images/ath12.png)

   - Click **Get Started**.
 
   - Click **Create a Project** > Standard

   - Name the project. Select **Storage** > cloud object storage. **Create**
   
 3. Upload the Dataset

![](https://github.com/Abeer-Haroon/Predicting-monthly-demand-of-items/blob/master/images/upload.png)

4. Open the dataset. Click on **Refine** to cleanse and shape it. 

    - Click on operation on the left - Select the Column "Item". Select **Replace Substring** and replace the strings with the following numbers as shown in the below gif.

    - TShirt - 1, Formal Shirts - 2, Jeans - 3, Formal Trousers - 4, Blazers - 5, Jackets - 6, Shoes - 7, Heels - 8, Scarves - 9, Hats - 10

![](https://github.com/Abeer-Haroon/Predicting-monthly-demand-of-items/blob/master/images/1Data%20RefineryVideo1.gif)
 
    - Select the right data type for every column by clicking on the 3 dots on the column > Convert column type > Select the right data type for the column.
    
![](https://github.com/Abeer-Haroon/Predicting-monthly-demand-of-items/blob/master/images/2Data%20RefineryVideo2.gif)

    - Save and Run the flow.

![](https://github.com/Abeer-Haroon/Predicting-monthly-demand-of-items/blob/master/images/3Data%20RefineryVideo3.gif)

    - Create an SPSS Modeler Flow. Upload the existing 'SPSS Flow - Store1Forecast.str' from the downloaded folder.
    

![](https://github.com/Abeer-Haroon/Predicting-monthly-demand-of-items/blob/master/images/4SPSSFlow.gif)

   - Create another flow the same way and upload 'SPSS Flow - Store2Forecast.str'
   - Run the flow

![](https://github.com/Abeer-Haroon/Predicting-monthly-demand-of-items/blob/master/images/5SPSSFlow-run.gif)

   - Save the created models by clicking on the golden nugget for each model and saving it as a PMML script. 

![](https://github.com/Abeer-Haroon/Predicting-monthly-demand-of-items/blob/master/images/6SPSSFlow-savemodel.gif)

   - Click on the saved model to deploy it as shown below. Repeat this for all the models.

![](https://github.com/Abeer-Haroon/Predicting-monthly-demand-of-items/blob/master/images/7SPSSFlow-deploy.gif)

   - Launch RStudio

![](https://github.com/Abeer-Haroon/Predicting-monthly-demand-of-items/blob/master/images/8RStudio-launch.png)

   - Upload the folder **Forecast** to RStudio

![](https://github.com/Abeer-Haroon/Predicting-monthly-demand-of-items/blob/master/images/9RStudio-uploading.gif)

   - Update Watson Machine Learning credentials and model endpoints in the code and run the app!
