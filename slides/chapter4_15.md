---
type: slides
---

# You made it! 💪

Notes: Congratulations! You finished our fourth and final case study in this course on case studies in supervised machine learning.

---

# Predicting age

```r
rmse(modeling_results, truth = age, estimate = CART)
```

```out
# A tibble: 3 x 3
  .metric .estimator .estimate
  <chr>   <chr>          <dbl>
1 rmse    standard        14.7
```

```r
rmse(modeling_results, truth = age, estimate = GBM)
```

```out
# A tibble: 3 x 3
  .metric .estimator .estimate
  <chr>   <chr>          <dbl>
1 rmse    standard        12.6 
```

```r
rmse(modeling_results, truth = age, estimate = XBG)
```

```out
# A tibble: 3 x 3
  .metric .estimator .estimate
  <chr>   <chr>          <dbl>
1 rmse    standard        12.5
```

Notes: You found that in this case study on the beliefs and opinions of Catholic nuns in the 1960s, the XGBoost gradient boosting model performed best, at least using the defaults for the various tuning parameters. 

---

# Predicting age

- **Build** your model with your training data
- **Choose** your model with your validation data
- **Evaluate** your model with your testing data

Notes: You divided your data into three subsets, used a training set to train your models, a validation set to choose between them, and then a testing set to evaluate the performance of your model and estimate how it will do with new data.

---

# Diverse data, powerful tools

- Fuel efficiency of cars 🚗
- Developers working remotely in the Stack Overflow survey 💻
- Voter turnout in 2016 🗳
- Catholic nuns' ages based on beliefs and attitudes ⛪

Notes: This analysis was just the final example in the series of predictive projects you approached in this course. 

You learned how to go from raw data to exploring that data to training models to evaluating those models using the [caret](https://topepo.github.io/caret/) package, the [tidymodels](https://github.com/tidymodels) metapackage, and important tools for exploratory data analysis from the [tidyverse](https://tidyverse.tidyverse.org/) ecosystem, like dplyr and ggplot2.

---

#  Practical machine learning

- Dealing with class imbalance
- Improving performance with resampling (bootstrap, cross-validation)

Notes: In this course, I've chosen to spend our energy and time on some of the issues that I have found to be the most important and most impactful from my real world, practical predictive modeling experience. These include knowing what to do when you are faced with class imbalance, and having some options in your toolkit for resampling approaches. 

---

# Practical machine learning

- Dealing with class imbalance
- Improving performance with resampling (bootstrap, cross-validation)
- Hyperparameter tuning?

Notes: By contrast, we haven't talked about hyperparameter tuning for any of these models. That is something you can do to improve performance for models like xgboost, but I'll be honest, in my real world work, the gains from optimizing hyperparameters have been smaller, compared to gains from time spent on the other practical considerations we have explored in this course.

---

# Practical machine learning

- Try out multiple modeling approaches for each new problem 
- Overall, [gradient tree boosting and random forest](https://arxiv.org/abs/1708.05070v1) 🌳 perform well

Notes: The high level takeaways that you should remember from this course are first, that each time you have a new predictive modeling problem you are working on, you need to try out multiple different kinds of models. You don't know ahead of time which kind of model is going to perform best. This paper linked here uses some super interesting analysis to show that most often, the two kinds of models that perform best are gradient tree boosting and random forest. 

However, depending on how much data you have and the specifics of your problem, that may not be true, so you have to try it for yourself. Also, start with a **simple model** to compare to. 

---

# Never skip exploratory data analysis ✅



Notes: And perhaps most importantly, never skip exploratory data analysis when you build machine learning models. It is time well spent, because when you understand a data set better, you can do a better job of building accurate models that perform better.

---

# Go train some models!

Notes: And that's our ultimate goal here! Thanks for spending time with me on this course. Now it's time for you to take what you've been practicing here and go apply it in the real world.

If this course has been helpful to you, you can [buy me a coffee](https://ko-fi.com/U7U4WG9B) or chip in for hosting costs.

[![ko-fi](https://www.ko-fi.com/img/githubbutton_sm.svg)](https://ko-fi.com/U7U4WG9B)












