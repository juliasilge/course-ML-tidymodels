---
title: 'Chapter 4: But what do the nuns think?'
description:
  'The last case study in this course uses an extensive survey of Catholic nuns fielded in 1967 to once more put your practical machine learning skills to use. You will predict the age of these religious women from their responses about their beliefs and attitudes.'
prev: /chapter3
next: /chapter1
type: chapter
id: 4
---

<exercise id="1" title="Surveying Catholic sisters in 1967" type="slides">

<slides source="chapter4_01">
</slides>

</exercise>

<exercise id="2" title="Choose an appropriate model">

In this case study, you will predict the age of Catholic nuns from their answers on a survey fielded in 1967 focusing on questions about social and religious issues. What kind of model will you build?

<choice>
<opt text="Summarization">

Summarization is not a type of supervised machine learning model we will cover in this course.

</opt>

<opt text="Clustering">

Clustering is an example of unsupervised machine learning, which we will not cover in this course.

</opt>

<opt text="Classification">

A classification model predicts a group membership or discrete class label, not a numeric/continuous value or response.

</opt>

<opt text="Regression" correct="true">

To predict a continuous, numeric quantity like age, use regression models.

</opt>
</choice>

</exercise>

<exercise id="3" title="Visualize the age distribution">

The first step before you start modeling is to explore your data, and we are going to spend a little more time on this step in this last case study. To start with, check out the distribution of ages for the respondents in this survey. 📊 (Keep in mind throughout this case study that the data you have in your environment is one quarter of the real survey data.)

**Instructions**

- Call `glimpse()` on `sisters67` to take a look at the structure of the data. Notice how many columns there are, and what their characteristics are.
- Plot a histogram of `age`.

<codeblock id="04_03">

You can build a histogram using [`geom_histogram()`](https://ggplot2.tidyverse.org/reference/geom_histogram.html).

</codeblock>

</exercise>

<exercise id="4" title="Tidy the survey data">

Embracing [tidy data principles](https://tidyverse.tidyverse.org/articles/manifesto.html) is a powerful option for exploratory data analysis. When your data is tidy, you can quickly iterate in getting to know your data better and making exploratory plots. Let's transform this wide data set into a tidy data frame with one observation per row, and then check out some characteristics of this subset of the original survey.

Note: There is a column called `sister` in this dataset that is an identifier for each survey respondent. We are removing this column in the exercise using [`select()`](https://dplyr.tidyverse.org/reference/select.html).

**Instructions**

- Use the [`pivot_longer()`](https://tidyr.tidyverse.org/reference/pivot_longer.html) function to transform the wide data set with each survey question in a separate column to a narrow, tidy data set with each survey question in a separate row.
- View the structure of this tidy data set using `glimpse()`.

<codeblock id="04_04_1">

When you implement `... %>% pivot_longer(-age, names_to = "key", values_to = "value")`, you transform the data set from wide (non-tidy) to narrow (tidy). The argument `-age` specifies that we want to keep the `age` column for each row.

</codeblock>

Next look at question agreement overall.

**Instructions**

- Group by `age` and summarize the `value` column to see how the overall agreement with all questions varied by age.
- Count the `value` column to check out how many respondents agreed or disagreed overall.

<codeblock id="04_04_2">

- Call the `group_by()` function first, and then `summarize()`. 
- To count the `value` column, use `count(value)`.

</codeblock>

</exercise>

<exercise id="5" title="Exploratory data analysis with tidy data" type="slides">

<slides source="chapter4_05">
</slides>

</exercise>

<exercise id="6" title="Visualize agreement with age">

The tidied version of the survey data that you constructed is available in your environment. You have many options at your fingertips with this tidy data now. Make a plot that shows how agreement on a subset of the questions changes with age.
 📉
In this exercise, we are using [`filter()`](https://dplyr.tidyverse.org/reference/filter.html) to subset the data to just a subset of the questions on the survey to look at.

**Instructions**

- Group by two variables, `key` and `value`, so you can calculate an average age for each answer to each question.
- Summarize for each grouping to find an average age.
- Choose the correct `geom` to make a line plot.

<codeblock id="04_06">

- You want to `group_by(key, value)` and `summarize(age)` to find the average age for each ansewr to each question.
- You can build a line plot using [`geom_line()`](https://ggplot2.tidyverse.org/reference/geom_path.html).

</codeblock>

</exercise>

<exercise id="7" title="Training, validation, and testing data">

It's time to split your data into different sets now. You've done this three times already in this course, but in this last case study we are also going to create a validation set. Using a validation set is a good option when you have enough data (otherwise, you can use resampling). 

**Instructions**

- Create two data partitions: 
    - Specify one to split between testing and everything else.
    - Specify another one to split between validation and training.

<codeblock id="04_07">

The [`initial_split()`](https://tidymodels.github.io/rsample/reference/initial_split.html) function splits off the testing set, and then [`validation_split()`](https://tidymodels.github.io/rsample/reference/validation_split.html) creates a single resample to be used for validation.

</codeblock>

</exercise>

<exercise id="8" title="Using your validation set">

This new validation set you just created will be used to...

<choice>
<opt text="train your models.">

Training is done with the training set.

</opt>

<opt text="compare models you have trained and choose which one to use." correct="true">

A validation test is used to compare models or tune hyperparameters.

</opt>

<opt text="do the final evaluation step where you estimate the performance of your model on new data.">

The final evaluation is done with the testing set. It is important to do this final evaluation with a separate data set so that you do not underestimate your error on new data.

</opt>
</choice>

</exercise>

<exercise id="9" title="Tune model hyperparameters" type="slides">

<slides source="chapter4_09">
</slides>

</exercise>

<exercise id="11" title="Training, validation, and testing data">

In this chapter, you will explore a few new kinds of models. Fun! 💃The `"gbm"` gradient boosting and `"xbgLinear"` extreme gradient boosting models take a very long time to train, so we'll upload trained models for you to evaluate in the next exercises. In this exercise, train a CART model with `"rpart"` to predict age with all the other columns.

To allow the code in this exercise to evaluate quickly, the training set in your environment only contains 500 rows. (You'll see a warning because the training set here is so small.)

**Instructions**

- Using caret, train a CART model to predict `age` based on all other variables on `sisters_train` data. 

When you don't give any specific [`trainControl()`](https://topepo.github.io/caret/model-training-and-tuning.html#basic-parameter-tuning) argument to `train()`, the model training is implemented with a default resampling strategy, 25 bootstrap resamplings.

<codeblock id="04_11">

- To train a model use the `train()` function. 
- The `method` argument to `train()` should be `"rpart"`.

</codeblock>

</exercise>

<exercise id="12" title="Making predictions">

Three models are available in your environment (trained on the data set in its entirety), the CART model you just trained along with two kinds of gradient boosting models. Your next task is to decide which of these models to use for prediction on new data. If you use the training data to evaluate the models, you will underestimate your error for new data and might make the wrong choice altogether. That leaves the validation data and the testing data.

**Instructions**

- Which data set should you use to choose between these three models, `sisters_validate` or `sisters_test`? Use that option to create a data frame for comparing the models.

<codeblock id="04_12">

The validation data set is the appropriate option for choosing between models.

</codeblock>

</exercise>

<exercise id="13" title="Choosing between models">

Now that you have created a data frame that contains all three models' predictions, let's compare their performance.

**Instructions**

- Load `yardstick`. 
- Use the [`metrics()`](https://tidymodels.github.io/yardstick/reference/metrics.html) function from the yardstick package to see how each model performed. There are two important arguments that you need to supply to `metrics()`, `truth` (the true age of each nun) and `estimate` (the predicted age of each nun). Which column in the data frame you created corresponds to each?

<codeblock id="04_13">

The `truth` argument should always be `age`, while the `estimate` column changes with each model.

</codeblock>

</exercise>

<exercise id="14" title="Estimating uncertainty for new data">

You just compared the three models you trained, and the XGBoost model performed best on the validation data set. Gradient boosting models are very effective and are a powerful tool in your machine learning arsenal. Before you take a trained model like this and use it to make predictions on new data, you must estimate how your final chosen model will perform. Specifically, let's estimate the [`rmse()`](https://tidymodels.github.io/yardstick/reference/rmse.html) for this model.

**Instructions**

- Which data set would you use to estimate how your model will perform on new data? You have `sisters_train`, `sisters_validate`, and `sisters_test` data sets available in your environment. Use the correct one *both* at the beginning of the pipe and within the call to `predict()`.
- Calculate the RMSE (root mean squared error) using the appropriate function from [yardstick](https://tidymodels.github.io/yardstick/).

<codeblock id="04_14">

You want to use the `sisters_test` data along with the `rmse()` function.

</codeblock>

</exercise>

<exercise id="15" title="Wrapping up" type="slides">

<slides source="chapter4_15">
</slides>

</exercise>
