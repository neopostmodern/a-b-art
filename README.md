A-B Art
=======

### About
The project *A-B Art* attempts to build an easy, fast and intuitive way to create comparative ratings of large image sets. In simple terms this means that it provides an interface to quickly decide which image (out of just two) is better. In a second step, based on different algorithms a generalized rating of the images can be calculated.

### Purpose
There are two main goals:
- Selection
- Training

#### Selection
*A-B Art* can be used to naïvely select the "best" images out of a large set. Shuffling, omission and reduction allow a different and overly-simple approach which can be especially useful for images that weren't created (or selected) by humans in the first place.

#### Training
Since every single sub-decision is fully recorded, valuable training data for machine learning projects is generated. This has not been explored in-depth as of 2015 but could be integrated into the project long-term.

### Evaluation mechanisms
- [x] Tree
- [ ] Markov-Chain (à la PageRank)
