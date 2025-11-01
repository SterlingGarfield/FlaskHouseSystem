// 散点图 option 封装
// scatterData: 数据数组，格式为 [[x轴索引, 总价格, 商品名称], ...]
// xAxis: x轴标签数组，对应交付日期
// names: 商品名称数组
// yAxisName: y轴名称
function getScatterOption(scatterData, xAxis, names, yAxisName) {
    return {
        tooltip: {
            trigger: 'item',
            showDelay: 0,
            formatter: function (params) {
                if (params.value.length > 1) {
                    return `${params.data[2]}<br/>${xAxis[params.data[0]]}<br/>总价格: ${params.data[1]}`;
                }
                return params.seriesName + ' :<br/>' + params.name + ' : ' + params.value;
            },
            axisPointer: {
                show: true,
                type: 'cross',
                lineStyle: {
                    type: 'dashed',
                    width: 1,
                    color: scatterColors.axis.line
                }
            }
        },
        legend: {
            type: 'scroll',
            orient: 'horizontal',
            top: 10,
            left: 'center',
            textStyle: {
                color: scatterColors.text
            },
            pageTextStyle: {
                color: scatterColors.text
            },
            pageIconColor: scatterColors.text,
            pageIconInactiveColor: 'rgba(255, 255, 255, 0.3)',
            pageButtonItemGap: 5,
            pageButtonGap: 5,
            pageButtonPosition: 'end',
            pageButtonItems: ['all', 'prev', 'next'],
            data: names.map((name, index) => ({
                name: name,
                itemStyle: {
                    color: scatterColors.gradient[index % scatterColors.gradient.length]
                }
            }))
        },
        grid: {
            left: '3%',
            right: '4%',
            top: '15%',
            bottom: '3%',
            containLabel: true
        },
        xAxis: {
            type: 'category',
            data: xAxis,
            axisLabel: {
                color: scatterColors.axis.label,
                rotate: 45
            },
            axisLine: {
                lineStyle: {
                    color: scatterColors.axis.line
                }
            },
            splitLine: {
                show: true,
                lineStyle: {
                    type: 'dashed',
                    color: scatterColors.axis.splitLine
                }
            }
        },
        yAxis: {
            type: 'value',
            name: yAxisName,
            nameTextStyle: {
                color: scatterColors.text
            },
            axisLabel: {
                color: scatterColors.axis.label
            },
            axisLine: {
                lineStyle: {
                    color: scatterColors.axis.line
                }
            },
            splitLine: {
                show: true,
                lineStyle: {
                    type: 'dashed',
                    color: scatterColors.axis.splitLine
                }
            }
        },
        series: [{
            name: '数据',
            type: 'scatter',
            data: scatterData,
            symbolSize: function (data) {
                return Math.sqrt(data[1]) / 2;
            },
            itemStyle: {
                color: function(params) {
                    return scatterColors.gradient[names.indexOf(params.data[2]) % scatterColors.gradient.length];
                }
            },
            emphasis: {
                focus: 'series',
                itemStyle: {
                    shadowBlur: 10,
                    shadowColor: 'rgba(0, 0, 0, 0.5)'
                }
            },
            markArea: {
                silent: true,
                itemStyle: {
                    color: 'transparent',
                    borderWidth: 1,
                    borderType: 'dashed',
                    borderColor: 'rgba(255, 255, 255, 0.3)'
                },
                data: [[{
                    name: '数据范围',
                    xAxis: 'min',
                    yAxis: 'min'
                }, {
                    xAxis: 'max',
                    yAxis: 'max'
                }]]
            },
            markPoint: {
                data: [
                    {
                        type: 'max',
                        name: '最大值',
                        itemStyle: {
                            color: scatterColors.gradient[0]
                        }
                    },
                    {
                        type: 'min',
                        name: '最小值',
                        itemStyle: {
                            color: scatterColors.gradient[1]
                        }
                    }
                ],
                label: {
                    color: scatterColors.text,
                    backgroundColor: 'rgba(0, 0, 0, 0.5)',
                    padding: [4, 8],
                    borderRadius: 4
                },
                symbolSize: 12
            },
            markLine: {
                lineStyle: {
                    type: 'solid',
                    color: scatterColors.text,
                    width: 2
                },
                label: {
                    color: scatterColors.text,
                    backgroundColor: 'rgba(0, 0, 0, 0.5)',
                    padding: [4, 8],
                    borderRadius: 4
                },
                data: [
                    {
                        type: 'average',
                        name: '平均值',
                        lineStyle: {
                            color: scatterColors.gradient[4]
                        }
                    },
                    {
                        type: 'median',
                        name: '中位数',
                        lineStyle: {
                            color: scatterColors.gradient[6]
                        }
                    }
                ]
            }
        }]
    };
}
