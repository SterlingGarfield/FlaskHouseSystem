// 雷达图 option 封装
// radarData: 数据数组，每个子数组代表一个分类的评分数据
// seriesNames: 系列名称数组，对应每个分类的名称
// radarIndicators: 雷达图指标配置数组，包含name和max属性
function getRadarOption(radarData, seriesNames, radarIndicators) {
    return {
        tooltip: {
            trigger: 'item'
        },
        legend: {
            data: seriesNames,
            textStyle: { color: radarColors.text }
        },
        radar: {
            indicator: radarIndicators,
            splitArea: {
                areaStyle: {
                    color: radarColors.splitArea
                }
            },
            axisLine: {
                lineStyle: {
                    color: radarColors.axis.line
                }
            },
            splitLine: {
                lineStyle: {
                    color: radarColors.axis.line
                }
            }
        },
        series: seriesNames.map((name, i) => ({
            name: name,
            type: 'radar',
            data: [{
                value: radarData[i],
                name: name,
                itemStyle: {
                    color: radarColors.gradient[i % radarColors.gradient.length]
                }
            }],
            areaStyle: {
                opacity: 0.3
            },
            lineStyle: {
                width: 2
            }
        }))
    };
}
