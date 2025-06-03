#' Function to return data prepared for time series modeling, note, handle missing before this step!
#' m30d = mean mortality / month
#' hd = mean hospital mortality / month
#' intervention_center = Control centers/Intervention centers
#' post_intervention = 1 or 0 marking when the intervention started
#' sex = mean of number of male patients / month
#' chock = mean of number of patients with chock / month
#' gcstot = mean score of all GCS scores / month
#' age = mean age / month
#' months_after = number of months from the intervention
#' n = number of patients per arm / month
#'
#' @import taft dplyr
#' @param data, TAFT dataset that has been populated using CreateColumns
#' @return data
#' @export
ReturnModelData <- function(data) {
  model_data <- data %>%
    mutate(s24h=as.integer(s24h)) %>%
    mutate(hd=as.integer(hd)) %>%
    mutate(s30d=as.integer(s30d)) %>%
    mutate(intervention_center = case_when(intervention == 0 ~ "Control centers",
                                           intervention == 1 ~ "Intervention centres")) %>%
    group_by(study_month, intervention_center) %>%
    summarise(s24h = mean(s24h),
              hd = mean(hd),
              m30d = mean(s30d),
              chock = mean(chock),
              age = mean(age),
              sex = mean(sex),
              gcstot = as.integer(mean(gcstot)),
              month=as.integer(mean(month)),
              n = n(),
              post_intervention = mean(as.integer(post_intervention))
              )

  model_data <- model_data %>%
    mutate(post_intervention = as.factor(post_intervention))

  return(model_data)
}
