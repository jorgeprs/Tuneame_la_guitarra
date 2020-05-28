function color = colorSelector(maxFValue, positiveRanges, negativeRanges)
if maxFValue <= positiveRanges(1) && maxFValue >= negativeRanges(1)
    color = 'g';
elseif maxFValue <= positiveRanges(2) && maxFValue >= negativeRanges(2)
    color = 'y';
else
    color = 'r';
end
end