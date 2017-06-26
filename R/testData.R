##############################################################################
#    Copyright (c) 2017 Russell V. Lenth                                     #
#                                                                            #
#    This file is part of the unrepx package for R (*unrepx*)                #
#                                                                            #
#    *unrepx* is free software: you can redistribute it and/or modify        #
#    it under the terms of the GNU General Public License as published by    #
#    the Free Software Foundation, either version 2 of the License, or       #
#    (at your option) any later version.                                     #
#                                                                            #
#    *unrepx* is distributed in the hope that it will be useful,             #
#    but WITHOUT ANY WARRANTY; without even the implied warranty of          #
#    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the           #
#    GNU General Public License for more details.                            #
#                                                                            #
#    You should have received a copy of the GNU General Public License       #
#    along with R and *unrepx*.  If not, see                                 #
#    <https://www.r-project.org/Licenses/> and/or                            #
#    <http://www.gnu.org/licenses/>.                                         #
##############################################################################

# Test data for experiments
# This is a list of lists.
# Each list has elts `x`, the data, and `desc`, a descriptive string

.testData = list(
    A15 = list(
        x = c(-2.0998, 0.5738, -0.6139, -0.1491, -0.7523, 0.148, 0.0483, 
            0.2857, 1.9654, 0.7801, -1.3749, 1.7739, -1.2189, -1.2333, 0.1315),
        desc = "rnorm(15)"
        ),
    B15 = list(
        x = c(1.6494, -0.5801, -0.1094, 2.427, 0.6776, -0.588, 0.8196, 0.5957, 
             0.7569, -0.5524, 0.2523, -0.2086, -0.6436, -2.8, 4.1),
        desc = "c(rnorm(13), -2.8, 4.1)"
        ),
    C15 = list(
        x = c(1.4957, -0.1769, -1.4286, -1.1727, -0.8641, -1.0626, 1.5052, 
              0.038, -0.4186, 0.5805, -0.0762, 0.3665, 0.3019, 1.4936, -1.497),
        desc = "rnorm(15) but values outside +/-1.5 are +/-1.5 + fuzz"
        ),
    D15 = list(
        x = c(0.9345, 0.7799, 0.4486, 0.3411, -1.962, 0.5941, -1.6668, -0.073, 
              0.0383, 0.5828, -0.3278, -0.0267, 2.907, 2.3332, -7.0078),
        desc = "c(rnorm(8), 3*rnorm(7))"
        ),
    A31 = list(
        x = c(0.3011, -0.9003, -0.9258, 0.2879, 0.4827, -0.086, -0.0712, 
              -0.4838, 1.7704, 0.5638, 1.0806, -0.5205, 0.0714, 0.2269, -1.1779, 
              0.041, -1.3928, -1.1796, 0.3326, 0.9142, 0.7686, 0.0363, 0.7113, 
              0.6091, 1.7872, 0.1205, 2.2797, -0.3611, 0.7812, -0.3077, 1.7587),
        desc = "rnorm(31)"
        ),
    B31 = list(
        x = c(0.2574, 0.76, 1.7689, 1.1009, 1.4088, -0.7325, 1.415, 0.174, 
              -0.9053, 0.3071, 1.9346, -0.4992, 2.269, 1.2703, 1.6002, -0.6716, 
              -0.013, 0.4139, -2.1357, 1.2155, -1.3383, 0.0477, -0.2676, -2.0823, 
              -2.1732, 0.698, 0.5506, -0.0374, 3.9, 3.1, -4.5),
        desc = "c(rnorm(28), 3.9,3.1,-4.5)"
        ),
    C31 = list(
        x = c(-0.9911, 0.3246, 0.8848, -0.8041, -1.4956, -1.4997, 0.0642, 
              1.2244, -1.4671, 0.4007, -0.1502, 0.6902, 0.618, -0.8211, -0.9868, 
              1.0034, -1.5129, -0.1762, 1.2482, 0.818, 0.2465, 0.4414, 0.1213, 
              0.132, 0.785, -0.6266, -0.0803, 0.8376, 1.4739, -0.5975, -1.4971),
        desc = "rnorm(31) but values outside +/-1.5 are +/-1.5 + fuzz"
        ),
    D31 = list(
        x = c(-2.6343, 1.0335, 0.8475, 0.6761, -1.2353, -0.2077, 0.077, 0.3476, 
              -0.986, 0.5344, 0.4145, -0.6011, 1.4245, -0.9792, 0.3624, -0.2891, 
              3.8143, -2.8441, 2.6577, 5.1472, -2.9963, 0.1735, -0.5788, -1.9155, 
              -2.9158, -5.927, -4.1121, -4.5525, -0.901, -3.0776, 3.8724),
        desc = "c(rnorm(16), 3*rnorm(15))"
        )
)

effExample = function(name, describe = FALSE) {
    a = .testData[[name]]
    if (describe) {
        cat("Description:\n\t")
        cat(paste(a$desc, "\n"))
    }
    a$x
}
