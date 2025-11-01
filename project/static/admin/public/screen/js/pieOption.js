// 环形图 option 封装
// data: 数据数组
// labels: 标签数组
function getPieOption(data, labels) {
    return {
        tooltip: {
            trigger: 'item',
            formatter: '{a} <br/>{b} : {c}个',
            textStyle: {
                color: pieColors.text
            }
        },
        legend: {
            orient: 'vertical',
            left: 'left',
            textStyle: {
                color: pieColors.text
            }
        },
        series: [
            {
                name: '商品分类',
                type: 'pie',
                radius: ['40%', '70%'],
                center: ['50%', '50%'],
                avoidLabelOverlap: false,
                itemStyle: {
                    borderRadius: 10,
                    borderColor: pieColors.border,
                    borderWidth: 2
                },
                label: {
                    show: true,
                    color: pieColors.text,
                    formatter: '{b}: {c}个'
                },
                labelLine: {
                    show: true,
                    lineStyle: {
                        color: pieColors.labelLine
                    }
                },
                emphasis: pieColors.emphasis,
                data: labels.map((label, index) => ({
                    value: data[index],
                    name: label,
                    itemStyle: {
                        color: pieColors.gradient[index % pieColors.gradient.length]
                    }
                }))
            }
        ]
    };
}
