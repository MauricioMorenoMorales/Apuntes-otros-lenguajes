def difference_in_ages(ages)
  older = -infinity
  younger = infinity
  for i in ages do
    if i > older
      older = i
    elsif i < younger
      younger = i
    end
  end
  [older, younger, older - younger]
end