// 热力图 option 封装
// heatmapData: 数据数组，格式为 [[x轴索引, y轴索引, 值], ...]
// xAxis: x轴标签数组，对应交付日期
// yAxis: y轴标签数组，对应商品名称
function getHeatmapOption(heatmapData, xAxis, yAxis) {
    return {
        tooltip: {
            position: 'top',
            formatter: function (params) {
                return `${yAxis[params.data[1]]}<br/>${xAxis[params.data[0]]}<br/>总价格: ${params.data[2]}`;
            }
        },
        grid: {
            height: '50%',
            top: '10%'
        },
        xAxis: {
            type: 'category',
            data: xAxis,
            splitArea: {
                show: true
            },
            axisLabel: {
                color: heatmapColors.axis.label,
                rotate: 45
            },
            axisLine: {
                lineStyle: { color: heatmapColors.axis.line }
            }
        },
        yAxis: {
            type: 'category',
            data: yAxis,
            splitArea: {
                show: true
            },
            axisLabel: {
                color: heatmapColors.axis.label
            },
            axisLine: {
                lineStyle: { color: heatmapColors.axis.line }
            }
        },
        visualMap: {
            min: 0,
            max: Math.max(...heatmapData.map(item => item[2])),
            calculable: true,
            orient: 'horizontal',
            left: 'center',
            bottom: '15%',
            textStyle: {
                color: heatmapColors.text
            },
            inRange: {
                color: heatmapColors.gradient
            }
        },
        series: [{
            // name: '商品定制价格',
            type: 'heatmap',
            data: heatmapData,
            label: {
                show: true,
                color: heatmapColors.text
            },
            itemStyle: {
                borderColor: heatmapColors.itemBorder,
                borderWidth: 1
            },
            emphasis: {
                itemStyle: {
                    shadowBlur: 10,
                    shadowColor: 'rgba(0, 0, 0, 0.5)'
                }
            }
        }]
    };
}
