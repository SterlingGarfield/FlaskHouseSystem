// 玫瑰图 option 封装
// data: 数据数组
// labels: 标签数组
function getRoseOption(data, labels) {
    return {
        tooltip: {
            trigger: 'item',
            formatter: '{a} <br/>{b} : {c}个',
            textStyle: {
                color: roseColors.text
            }
        },
        legend: {
            top: 'bottom',
            textStyle: {
                color: roseColors.text
            }
        },
        series: [
            {
                name: '性别分布',
            type: 'pie',
                radius: ['30%', '75%'],
                center: ['50%', '50%'],
            roseType: 'area',
                itemStyle: {
                    borderRadius: 8,
                    borderColor: roseColors.border,
                    borderWidth: 2
                },
                label: {
                    show: true,
                    color: roseColors.text,
                    formatter: '{b}: {c}个'
                },
                labelLine: {
                    show: true,
                    lineStyle: {
                        color: roseColors.labelLine
                    }
                },
                emphasis: roseColors.emphasis,
                areaStyle: roseColors.areaStyle,
                data: labels.map((label, index) => ({
                    value: data[index],
                    name: label,
                    itemStyle: {
                        color: roseColors.gradient[index % roseColors.gradient.length]
                    }
                }))
            }
        ]
    };
}
