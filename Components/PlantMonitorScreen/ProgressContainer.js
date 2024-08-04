import { View, Text, StyleSheet } from "react-native";
import React from "react";
import CircularProgress from "react-native-circular-progress-indicator";

const ProgressContainer = ({ name, suffix, value }) => {
  return (
    <View style={styles.progressContainer}>
      <CircularProgress
        value={value}
        inActiveStrokeColor={"#2ecc71"}
        inActiveStrokeOpacity={0.2}
        progressValueColor={"#000"}
        valueSuffix={suffix}
        radius={40}
      />
      <Text style={styles.title}>{name}</Text>
    </View>
  );
};
const styles = StyleSheet.create({
  progressContainer: {
    flexDirection: "column",
    justifyContent: "center",
    alignItems: "center",
  },
  title: {
    width: "100%",
    textAlign: "center",
    fontFamily: "San Francisco",
    fontWeight: "500",
    fontSize: 12,
  },
});
export default ProgressContainer;
