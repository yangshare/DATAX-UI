package net.iharding.utils;


import java.net.InetAddress;
import java.net.UnknownHostException;

import org.apache.commons.lang.math.NumberUtils;
import org.elasticsearch.client.Client;
import org.elasticsearch.client.transport.TransportClient;
import org.elasticsearch.common.settings.Settings;
import org.elasticsearch.common.transport.InetSocketTransportAddress;
import org.elasticsearch.plugin.deletebyquery.DeleteByQueryPlugin;
/**
 * elastic search工具类
 * @author admin
 *
 */
public class ElasticSearchUtils {
	
	private static String hostsStr=PropertyUtils.getUserIndexHosts();
	private static String clusterName=PropertyUtils.getElasticSearchClusterName();
	//private static Node node =nodeBuilder().clusterName(PropertyUtils.getElasticSearchClusterName()).client(true).node();;
	
	private static Client client=null;
	/**
	 * 获取es连接
	 * @return
	 */
	@SuppressWarnings("resource")
	public static Client getClient(){
		if (client==null){
			String[] hosts=HBStringUtils.split(hostsStr,";");
			int id=0;
			InetSocketTransportAddress[] transportAddress=new InetSocketTransportAddress[hosts.length];
			for(String host:hosts){
				String[] hp=HBStringUtils.split(host,":");
				try {
					transportAddress[id]=new InetSocketTransportAddress(InetAddress.getByName(hp[0]),NumberUtils.toInt(hp[1],9300));
				} catch (UnknownHostException e) {
					e.printStackTrace();
				}
				id++;
			}
			 Settings settings = Settings.settingsBuilder()     
		                .put("cluster.name", clusterName).put("client.transport.sniff", true).build();
			 client=TransportClient.builder().settings(settings).addPlugin(DeleteByQueryPlugin.class).build().addTransportAddresses(transportAddress);
		}
		return client;
	}
	
	/**
	 * 关闭es连接
	 * @param client
	 */
	public static void releaseEsClient(){
		if (client!=null){
			client.close();
			client=null;
		}
	}
	

}
