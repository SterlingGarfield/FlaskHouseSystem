// 堆叠面积图 option 封装
// names: 名称数组
// xAxis: x轴数组
// dynamicData: 数据数组，格式为 [[交付日期, 总价格, 商品名称], ...]
function getStackedAreaOption(names, xAxis, dynamicData) {
    // 按名称分组数据
    const seriesData = names.map((name, index) => {
        const data = dynamicData
            .filter(item => item[2] === name)
            .sort((a, b) => xAxis.indexOf(a[0]) - xAxis.indexOf(b[0]))
            .map(item => item[1]);

        return {
            name: name,
            type: 'line',
            stack: 'Total',
            areaStyle: {},
            smooth: true,
            emphasis: {
                focus: 'series'
            },
            data: data,
            itemStyle: {
                color: stackedAreaColors.gradient[index % stackedAreaColors.gradient.length]
            }
        };
    });

    return {
        tooltip: {
            trigger: 'axis',
            axisPointer: {
                type: 'cross',
                label: {
                    backgroundColor: stackedAreaColors.axisPointerBg
                }
            }
        },
        legend: {
            data: names,
            textStyle: { color: stackedAreaColors.text }
        },
        grid: {
            left: '3%',
            right: '4%',
            bottom: '3%',
            containLabel: true
        },
        xAxis: {
            type: 'category',
            boundaryGap: false,
            data: xAxis,
            axisLabel: { color: stackedAreaColors.axis.label },
            axisLine: {
                lineStyle: { color: stackedAreaColors.axis.line }
            },
            splitLine: {
                show: true,
                lineStyle: { color: stackedAreaColors.axis.splitLine }
            }
        },
        yAxis: {
            type: 'value',
            axisLabel: { color: stackedAreaColors.axis.label },
            axisLine: {
                lineStyle: { color: stackedAreaColors.axis.line }
            },
            splitLine: {
                show: true,
                lineStyle: { color: stackedAreaColors.axis.splitLine }
            }
        },
        series: seriesData
    };
}
