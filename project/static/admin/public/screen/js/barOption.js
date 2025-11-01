// 柱状图 option 封装（支持双系列、工具箱、标记等）
// data: 数据数组，格式为 [[商家名称1, 注册资本, 员工数], [商家名称2, 注册资本, 员工数], ...]
// labels: 标签数组，对应data中每个子数组的第一个元素
// seriesNames: 系列名称数组，如 ['注册资本', '员工数']
function getBarOption(data, labels, seriesNames) {
    var values = [];
    data.forEach(o => {
        values.push(o.splice(1));
    });
    var series = [];
    for (let i = 0; i < seriesNames.length; i++) {
        series.push({
            name: seriesNames[i],
            type: 'bar',
            data: values.map(v => v[i]),
            markPoint: {
                data: [
                    { type: 'max', name: 'Max' },
                    { type: 'min', name: 'Min' }
                ]
            },
            markLine: {
                data: [{ type: 'average', name: 'Avg' }]
            },
            itemStyle: {
                ...barColors.itemStyle,
                color: barColors.gradient[i % barColors.gradient.length]
            },
            emphasis: barColors.emphasis
        });
    }
    return {
        tooltip: {
            trigger: 'axis',
            axisPointer: {
                type: 'shadow'
            },
            textStyle: {
                color: barColors.text
            }
        },
        legend: {
            data: seriesNames,
            textStyle: {
                color: barColors.text
            }
        },
        grid: {
            left: '3%',
            right: '4%',
            bottom: '3%',
            containLabel: true
        },
        calculable: true,
        xAxis: [
            {
                type: 'category',
                data: labels,
                axisLine: {
                    lineStyle: {
                        color: barColors.axis.line
                    }
                },
                axisLabel: {
                    color: barColors.axis.label,
                    rotate: 45
                },
                splitLine: {
                    show: false
                }
            }
        ],
        yAxis: [
            {
                type: 'value',
                axisLine: {
                    lineStyle: {
                        color: barColors.axis.line
                    }
                },
                axisLabel: {
                    color: barColors.axis.label
                },
                splitLine: {
                    lineStyle: {
                        color: barColors.axis.splitLine
                    }
                }
            }
        ],
        series: series
    };
}
