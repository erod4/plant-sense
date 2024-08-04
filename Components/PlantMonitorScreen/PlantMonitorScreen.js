import { View, Text, ScrollView, SafeAreaView } from "react-native";
import React from "react";
import SinglePlantMonitor from "./SinglePlantMonitor";

const PlantMonitorScreen = () => {
  return (
    <SafeAreaView
      style={{
        height: "100%",
        width: "100%",
        justifyContent: "center",
      }}
    >
      <ScrollView
        style={{
          height: "100%",
          width: "100%",
          paddingVertical: 50,
        }}
        contentContainerStyle={{
          alignItems: "center",
          gap: 30,
        }}
      >
        <SinglePlantMonitor />
        <SinglePlantMonitor />
        <SinglePlantMonitor />
        <SinglePlantMonitor />
        <SinglePlantMonitor />
      </ScrollView>
    </SafeAreaView>
  );
};

export default PlantMonitorScreen;
