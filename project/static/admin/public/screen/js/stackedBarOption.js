// 堆叠条形图 option 封装
// data: 数据数组，格式为 [[分类名称1, 定制库存, 定制价格], [分类名称2, 定制库存, 定制价格], ...]
// labels: 标签数组，对应data中每个子数组的第一个元素
// seriesNames: 系列名称数组，如 ['定制库存', '定制价格']
function getStackedBarOption(data, labels, seriesNames) {

    var values = [];
    data.forEach(o => {
        values.push(o.splice(1));
    });

    var series = [];
    for (let i = 0; i < seriesNames.length; i++) {
        series.push({
            name: seriesNames[i],
            type: 'bar',
            stack: 'total',
            data: values.map(v => v[i]),
            itemStyle: { color: stackedBarColors.colorList[i % stackedBarColors.colorList.length] }
        });
    }
    return {
        tooltip: {
            trigger: 'axis',
            axisPointer: {
                type: 'shadow'
            }
        },
        legend: {
            data: seriesNames,
            textStyle: { color: stackedBarColors.legend }
        },
        xAxis: {
            type: 'value',
            axisLabel: { color: stackedBarColors.xAxis }
        },
        yAxis: {
            type: 'category',
            data: labels,
            axisLabel: { color: stackedBarColors.yAxis }
        },
        series: series
    };
}
