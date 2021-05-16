import day from 'dayjs';

const timeFilter = (str: any, weekday = true) => day(str).format(`YYYY-MM-DD${weekday ? ' dddd' : ''}`);

export default timeFilter;
