// 在配置中使用
// 漏斗图 option 封装
// data: 数据数组
// labels: 标签数组
function getFunnelOption(data, labels, name) {
    return {
        tooltip: {
            trigger: 'item',
            formatter: '{a} <br/>{b} : {c}个',
            textStyle: {
                color: funnelColors.text
            }
        },
        legend: {
            data: labels,
            textStyle: {
                color: funnelColors.text
            }
        },
        series: [
            {
                name: name,
                type: 'funnel',
                left: '10%',
                top: 60,
                bottom: 60,
                width: '80%',
                min: 0,
                max: Math.max(...data),
                minSize: '0%',
                maxSize: '100%',
                sort: 'descending',
                gap: 2,
                label: {
                    show: true,
                    position: 'inside',
                    formatter: '{b}: {c}',
                    color: funnelColors.text
                },
                labelLine: {
                    length: 10,
                    lineStyle: {
                        width: 1,
                        type: 'solid',
                        color: funnelColors.labelLine
                    }
                },
                itemStyle: {
                    borderColor: funnelColors.border,
                    borderWidth: 1,
                    color: function(params) {
                        return funnelColors.gradient[params.dataIndex % funnelColors.gradient.length];
                    }
                },
                emphasis: funnelColors.emphasis,
                data: labels.map((label, index) => ({
                    value: data[index],
                    name: label,
                    itemStyle: {
                        color: funnelColors.gradient[index % funnelColors.gradient.length]
                    }
                }))
            }
        ]
    };
}
